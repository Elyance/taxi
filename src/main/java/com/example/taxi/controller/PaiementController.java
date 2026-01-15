package com.example.taxi.controller;

import com.example.taxi.entity.Commande;
import com.example.taxi.entity.Paiement;
import com.example.taxi.entity.ModePaiement;
import com.example.taxi.service.CommandeService;
import com.example.taxi.service.PaiementService;
import com.example.taxi.service.ModePaiementService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/paiement")
public class PaiementController {

    @Autowired
    private CommandeService commandeService;

    @Autowired
    private PaiementService paiementService;

    @Autowired
    private ModePaiementService modePaiementService;

    @GetMapping("/form")
    public String showPaymentForm(
            @RequestParam(value = "commandeId") Long commandeId,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        // Récupérer la commande
        Commande commande = commandeService.getCommandeById(commandeId);
        if (commande == null) {
            model.addAttribute("error", "Commande non trouvée");
            return "redirect:/voyage/list";
        }

        // Récupérer tous les modes de paiement
        List<ModePaiement> modesPaiement = modePaiementService.getAllModesPaiement();

        model.addAttribute("commande", commande);
        model.addAttribute("modesPaiement", modesPaiement);
        model.addAttribute("montantParDefaut", commande.getMontantTotal());
        model.addAttribute("pageTitle", "Formulaire de Paiement");
        model.addAttribute("contentPage", "/WEB-INF/jsp/paiement/form.jsp");
        return "includes/layout";
    }

    @PostMapping("/process")
    public String processPaiement(
            @RequestParam(value = "commandeId") Long commandeId,
            @RequestParam(value = "montant") String montantStr,
            @RequestParam(value = "modePaiement") String modePaiement,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            // Récupérer la commande
            Commande commande = commandeService.getCommandeById(commandeId);
            if (commande == null) {
                throw new Exception("Commande non trouvée");
            }

            // Valider le montant
            BigDecimal montant = null;
            if (montantStr != null && !montantStr.isEmpty()) {
                try {
                    montant = new BigDecimal(montantStr);
                } catch (NumberFormatException e) {
                    throw new Exception("Montant invalide");
                }
            } else {
                montant = commande.getMontantTotal();
            }

            if (montant.compareTo(BigDecimal.ZERO) <= 0) {
                throw new Exception("Le montant doit être supérieur à 0");
            }

            // Créer le paiement (qui met à jour aussi les statuts)
            Paiement paiement = paiementService.createPaiement(commande, montant, modePaiement);

            // Récupérer le voyageId pour rediriger vers les places
            Long voyageId = paiementService.getVoyageIdForCommande(commandeId);
            if (voyageId != null) {
                return "redirect:/voyage/" + voyageId + "/places";
            }

            model.addAttribute("success", "Paiement effectué avec succès");
            return "redirect:/voyage/list";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors du paiement: " + e.getMessage());
            model.addAttribute("commande", commandeService.getCommandeById(commandeId));
            model.addAttribute("montantParDefaut", commandeService.getCommandeById(commandeId).getMontantTotal());
            model.addAttribute("pageTitle", "Formulaire de Paiement");
            model.addAttribute("contentPage", "/WEB-INF/jsp/paiement/form.jsp");
            return "includes/layout";
        }
    }
}
