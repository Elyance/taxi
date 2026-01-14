package com.example.taxi.controller;

import com.example.taxi.service.TrajetService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequestMapping("/trajet")
public class TrajetController {

    @Autowired
    private TrajetService trajetService;

    @GetMapping("/list")
    public String listTrajets(
            @RequestParam(value = "idGareDepart", required = false) Long idGareDepart,
            @RequestParam(value = "idGareArrivee", required = false) Long idGareArrivee,
            @RequestParam(value = "prixMin", required = false) String prixMin,
            @RequestParam(value = "prixMax", required = false) String prixMax,
            HttpSession session,
            Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        List<com.example.taxi.entity.TrajetWithTarif> trajets;
        if ((idGareDepart != null && idGareDepart > 0) ||
            (idGareArrivee != null && idGareArrivee > 0) ||
            (prixMin != null && !prixMin.isEmpty()) ||
            (prixMax != null && !prixMax.isEmpty())) {
            trajets = trajetService.searchTrajets(idGareDepart, idGareArrivee, prixMin, prixMax);
        } else {
            trajets = trajetService.getAllTrajetsWithTarif();
        }

        model.addAttribute("trajets", trajets);
        model.addAttribute("gares", trajetService.getAllGares());
        model.addAttribute("pageTitle", "Gestion des Trajets");
        model.addAttribute("contentPage", "/WEB-INF/jsp/trajet/list.jsp");
        return "includes/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        model.addAttribute("gares", trajetService.getAllGares());
        model.addAttribute("pageTitle", "Créer un Trajet");
        model.addAttribute("contentPage", "/WEB-INF/jsp/trajet/create.jsp");
        return "includes/layout";
    }

    @PostMapping("/create")
    public String createTrajet(
            @RequestParam(value = "idGareDepart") Long idGareDepart,
            @RequestParam(value = "idGareArrivee") Long idGareArrivee,
            @RequestParam(value = "tarifPrix", required = false) String tarifPrixStr,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        try {
            trajetService.createTrajet(idGareDepart, idGareArrivee, tarifPrixStr);
            return "redirect:/trajet/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("gares", trajetService.getAllGares());
            model.addAttribute("pageTitle", "Créer un Trajet");
            model.addAttribute("contentPage", "/WEB-INF/jsp/trajet/create.jsp");
            return "includes/layout";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la création du trajet");
            model.addAttribute("gares", trajetService.getAllGares());
            model.addAttribute("pageTitle", "Créer un Trajet");
            model.addAttribute("contentPage", "/WEB-INF/jsp/trajet/create.jsp");
            return "includes/layout";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteTrajet(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        trajetService.deleteTrajet(id);
        return "redirect:/trajet/list";
    }
}
