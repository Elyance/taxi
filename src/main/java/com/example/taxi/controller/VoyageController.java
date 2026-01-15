package com.example.taxi.controller;

import com.example.taxi.entity.*;
import com.example.taxi.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@Controller
@RequestMapping("/voyage")
public class VoyageController {

    @Autowired
    private VoyageService voyageService;

    @Autowired
    private TrajetService trajetService;

    @Autowired
    private ChauffeurService chauffeurService;

    @Autowired
    private VehiculeService vehiculeService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private PlaceService placeService;

    @GetMapping("/list")
    public String listVoyages(
            @RequestParam(value = "idTrajet", required = false) Long idTrajet,
            @RequestParam(value = "date", required = false) String date,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        // Utiliser VoyageDetails pour obtenir les voyages avec toutes les informations détaillées
        List<VoyageDetails> voyages = voyageService.searchVoyages(idTrajet, date);
        
        model.addAttribute("voyages", voyages);
        model.addAttribute("trajets", trajetService.getAllTrajets());
        model.addAttribute("pageTitle", "Gestion des Voyages");
        model.addAttribute("contentPage", "/WEB-INF/jsp/voyage/list.jsp");
        return "includes/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        model.addAttribute("chauffeurs", chauffeurService.getAllChauffeurs());
        model.addAttribute("vehicules", vehiculeService.getAllVehicules());
        model.addAttribute("trajets", trajetService.getAllTrajets());
        model.addAttribute("pageTitle", "Créer un Voyage");
        model.addAttribute("contentPage", "/WEB-INF/jsp/voyage/create.jsp");
        return "includes/layout";
    }

    @PostMapping("/create")
    public String createVoyage(
            @RequestParam(value = "idChauffeur") Long idChauffeur,
            @RequestParam(value = "idVehicule") Long idVehicule,
            @RequestParam(value = "idTrajet") Long idTrajet,
            @RequestParam(value = "dateVoyage") String dateVoyage,
            @RequestParam(value = "heureVoyage") String heureVoyage,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            // Combiner date et heure en LocalDateTime (format: 2026-01-14T14:30:00)
            String dateTimeString = dateVoyage + "T" + heureVoyage + ":00";
            voyageService.createVoyage(idChauffeur, idVehicule, idTrajet, dateTimeString);
            return "redirect:/voyage/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("chauffeurs", chauffeurService.getAllChauffeurs());
            model.addAttribute("vehicules", vehiculeService.getAllVehicules());
            model.addAttribute("trajets", trajetService.getAllTrajets());
            model.addAttribute("pageTitle", "Créer un Voyage");
            model.addAttribute("contentPage", "/WEB-INF/jsp/voyage/create.jsp");
            return "includes/layout";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la création du voyage");
            model.addAttribute("chauffeurs", chauffeurService.getAllChauffeurs());
            model.addAttribute("vehicules", vehiculeService.getAllVehicules());
            model.addAttribute("trajets", trajetService.getAllTrajets());
            model.addAttribute("pageTitle", "Créer un Voyage");
            model.addAttribute("contentPage", "/WEB-INF/jsp/voyage/create.jsp");
            return "includes/layout";
        }
    }

    @GetMapping("/{id}/places")
    public String showPlaces(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Voyage voyage = voyageService.getVoyageById(id);
        if (voyage == null) {
            return "redirect:/voyage/list";
        }

        // Récupérer toutes les places avec leur statut
        List<PlaceInfo> allPlaces = placeService.getAllPlacesWithStatusForVoyage(id);

        model.addAttribute("selectedVoyage", voyage);
        model.addAttribute("allPlaces", allPlaces);
        model.addAttribute("tarif", allPlaces.isEmpty() ? null : placeService.getTarifForVoyage(id));
        model.addAttribute("clients", clientService.getAllClients());
        model.addAttribute("pageTitle", "Sélectionner une Place");
        model.addAttribute("contentPage", "/WEB-INF/jsp/voyage/places.jsp");
        return "includes/layout";
    }
}
