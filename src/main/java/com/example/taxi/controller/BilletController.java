package com.example.taxi.controller;

import com.example.taxi.entity.*;
import com.example.taxi.service.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.*;
import java.math.BigDecimal;
import java.util.List;
@Controller
@RequestMapping("/billet")
public class BilletController {

    @Autowired
    private PlaceService placeService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private CommandeService commandeService;

    @Autowired
    private BilletPlaceStatutService billetPlaceStatutService;

    @Autowired
    private TrajetService trajetService;

    @PostMapping("/create")
    public String createBillets(
            @RequestParam(value = "voyageId") Long voyageId,
            @RequestParam(value = "selectedPlaces") String selectedPlaces,
            @RequestParam(value = "clientType") String clientType,
            @RequestParam(value = "clientId", required = false) Long clientId,
            @RequestParam(value = "newClientNom", required = false) String newClientNom,
            @RequestParam(value = "newClientTelephone", required = false) String newClientTelephone,
            @RequestParam(value = "totalAmount", required = false) String totalAmount,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            // Récupérer ou créer le client
            Client client = null;
            if ("existing".equals(clientType)) {
                if (clientId == null) {
                    throw new Exception("Veuillez sélectionner un client");
                }
                client = clientService.getClientById(clientId);
                if (client == null) {
                    throw new Exception("Client non trouvé");
                }
            } else if ("new".equals(clientType)) {
                if (newClientNom == null || newClientNom.trim().isEmpty() ||
                    newClientTelephone == null || newClientTelephone.trim().isEmpty()) {
                    throw new Exception("Veuillez remplir tous les champs obligatoires du client");
                }
                client = clientService.createClient(newClientNom, newClientTelephone);
            } else {
                throw new Exception("Type de client invalide");
            }

            // Parser les places sélectionnées
            List<Long> placeNumbers = placeService.parseSelectedPlaces(selectedPlaces);
            if (placeNumbers.isEmpty()) {
                throw new Exception("Aucune place sélectionnée");
            }

            // Convertir le montant total en BigDecimal
            BigDecimal montant = null;
            if (totalAmount != null && !totalAmount.isEmpty()) {
                try {
                    montant = new BigDecimal(totalAmount);
                } catch (NumberFormatException e) {
                    montant = null;
                }
            }

            // Créer les billets
            List<Billet> billets = placeService.createBilletsForPlaces(voyageId, placeNumbers, client, montant);

            // Créer la commande et les détails de commande
            Commande commande = commandeService.createCommandeWithDetails(client, billets, montant);

            // Rediriger vers la page de paiement
            return "redirect:/paiement/form?commandeId=" + commande.getIdCommande();
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la création de la commande: " + e.getMessage());
            return "redirect:/voyage/list";
        }
    }

    @GetMapping("/list")
    public String listBillets(
            @RequestParam(value = "idTrajet", required = false) Long idTrajet,
            @RequestParam(value = "dateDebut", required = false) String dateDebutStr,
            @RequestParam(value = "dateFin", required = false) String dateFinStr,
            @RequestParam(value = "immatriculation", required = false) String immatriculation,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            // Conversion des dates
            LocalDateTime dateDebut = null;
            LocalDateTime dateFin = null;

            if (dateDebutStr != null && !dateDebutStr.isEmpty()) {
                dateDebut = LocalDateTime.parse(dateDebutStr + "T00:00:00");
            }

            if (dateFinStr != null && !dateFinStr.isEmpty()) {
                dateFin = LocalDateTime.parse(dateFinStr + "T23:59:59");
            }

            // Récupération des billets (tous par défaut, filtrés si paramètres présents)
            List<BilletPlaceStatut> billets = billetPlaceStatutService.searchBillets(idTrajet, dateDebut, dateFin, immatriculation);

            // Calcul des statistiques
            BigDecimal chiffreAffaire = BigDecimal.ZERO;
            for (BilletPlaceStatut billet : billets) {
                if (billet.getTarifTrajet() != null) {
                    chiffreAffaire = chiffreAffaire.add(billet.getTarifTrajet());
                }
            }
            var nombreBillets = billets.size();

            // Récupération des trajets pour le filtre
            var trajets = trajetService.getAllTrajets();

            model.addAttribute("billets", billets);
            model.addAttribute("trajets", trajets);
            model.addAttribute("chiffreAffaire", chiffreAffaire);
            model.addAttribute("nombreBillets", nombreBillets);
            model.addAttribute("pageTitle", "Gestion des Billets");
            model.addAttribute("contentPage", "/WEB-INF/jsp/billet/list.jsp");
            return "includes/layout";

        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la récupération des billets: " + e.getMessage());
            model.addAttribute("pageTitle", "Gestion des Billets");
            model.addAttribute("contentPage", "/WEB-INF/jsp/billet/list.jsp");
            return "includes/layout";
        }
    }

    @GetMapping("/details/{id}")
    public String showDetails(
            @PathVariable Long id,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            BilletPlaceStatut billet = billetPlaceStatutService.findById(id);
            if (billet == null) {
                return "redirect:/billet/list?error=Billet non trouvé";
            }
            model.addAttribute("billet", billet);
            model.addAttribute("pageTitle", "Détails du Billet");
            model.addAttribute("contentPage", "/WEB-INF/jsp/billet/details.jsp");
            return "includes/layout";
        } catch (Exception e) {
            return "redirect:/billet/list?error=" + e.getMessage();
        }
    }
}
