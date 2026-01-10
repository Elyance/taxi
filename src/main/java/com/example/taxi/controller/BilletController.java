package com.example.taxi.controller;

import com.example.taxi.entity.Billet;
import com.example.taxi.entity.Client;
import com.example.taxi.entity.Paiement;
import com.example.taxi.entity.Tarif;
import com.example.taxi.entity.Vehicule;
import com.example.taxi.entity.Voyage;
import com.example.taxi.repository.PaiementRepository;
import com.example.taxi.repository.TarifRepository;
import com.example.taxi.repository.VehiculeRepository;
import com.example.taxi.repository.VoyageRepository;
import com.example.taxi.service.BilletService;
import com.example.taxi.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/billets")
public class BilletController {

    @Autowired
    private BilletService billetService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private PaiementRepository paiementRepository;

    @Autowired
    private VoyageRepository voyageRepository;

    @Autowired
    private TarifRepository tarifRepository;

    @Autowired
    private VehiculeRepository vehiculeRepository;

    @GetMapping("/client-form")
    public String showClientForm(
            @RequestParam Long idVoyage,
            @RequestParam Integer idPlace,
            Model model) {
        
        List<Client> clients = clientService.getAllClients();
        model.addAttribute("clients", clients);
        model.addAttribute("idVoyage", idVoyage);
        model.addAttribute("idPlace", idPlace);
        
        // Récupérer le voyage pour obtenir le trajet
        Voyage voyage = voyageRepository.findById(idVoyage)
                .orElseThrow(() -> new RuntimeException("Voyage non trouvé"));
        
        // Récupérer le tarif du trajet
        Tarif tarif = tarifRepository.findByTrajetIdTrajet(voyage.getTrajet().getIdTrajet())
                .orElse(null);
        
        BigDecimal montant = (tarif != null) ? tarif.getPrixBase() : BigDecimal.valueOf(50000.00);
        model.addAttribute("montant", montant);
        
        return "billet/client-form";
    }

    @PostMapping("/create")
    public String createBillet(
            @RequestParam(required = false) Long idClient,
            @RequestParam(required = false) String nomClient,
            @RequestParam(required = false) String telephoneClient,
            @RequestParam Long idVoyage,
            @RequestParam Integer idPlace,
            @RequestParam BigDecimal montant,
            Model model) {
        
        try {
            Billet billet = billetService.creerBillet(
                idClient, nomClient, telephoneClient, 
                idVoyage, idPlace, montant
            );
            
            return "redirect:/billets/" + billet.getIdBillet() + "/details";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "redirect:/billets/client-form?idVoyage=" + idVoyage + "&idPlace=" + idPlace;
        }
    }

    @GetMapping("/{idBillet}/details")
    public String showBilletDetails(@PathVariable Long idBillet, Model model) {
        Billet billet = billetService.getBilletById(idBillet)
                .orElseThrow(() -> new RuntimeException("Billet non trouvé"));
        
        Paiement paiement = paiementRepository.findByBilletIdBillet(idBillet)
                .orElse(null);
        
        model.addAttribute("billet", billet);
        model.addAttribute("paiement", paiement);
        return "billet/details";
    }

    @GetMapping
    public String listBillets(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime dateHeure,
            @RequestParam(required = false) Long idVehicule,
            Model model) {
        
        List<Billet> billets;
        if (dateHeure != null || idVehicule != null) {
            billets = billetService.getBilletsWithFilters(dateHeure, idVehicule);
        } else {
            billets = billetService.getAllBillets();
        }
        
        List<Vehicule> vehicules = vehiculeRepository.findAll();
        
        model.addAttribute("billets", billets);
        model.addAttribute("vehicules", vehicules);
        model.addAttribute("dateHeure", dateHeure);
        model.addAttribute("idVehicule", idVehicule);
        
        return "billet/list";
    }
}
