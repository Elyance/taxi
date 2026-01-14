package com.example.taxi.controller;

import com.example.taxi.entity.Chauffeur;
import com.example.taxi.service.ChauffeurService;
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
@RequestMapping("/chauffeur")
public class ChauffeurController {

    @Autowired
    private ChauffeurService chauffeurService;

    @GetMapping("/list")
    public String listChauffeurs(
            @RequestParam(value = "nom", required = false) String nom,
            @RequestParam(value = "prenom", required = false) String prenom,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        List<Chauffeur> chauffeurs;
        if ((nom != null && !nom.isEmpty()) || (prenom != null && !prenom.isEmpty())) {
            chauffeurs = chauffeurService.searchChauffeurs(nom, prenom);
        } else {
            chauffeurs = chauffeurService.getAllChauffeurs();
        }

        model.addAttribute("chauffeurs", chauffeurs);
        model.addAttribute("pageTitle", "Gestion des Chauffeurs");
        model.addAttribute("contentPage", "/WEB-INF/jsp/chauffeur/list.jsp");
        return "includes/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        model.addAttribute("pageTitle", "Ajouter un Chauffeur");
        model.addAttribute("contentPage", "/WEB-INF/jsp/chauffeur/create.jsp");
        return "includes/layout";
    }

    @PostMapping("/create")
    public String createChauffeur(
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam(value = "telephone", required = false) String telephone,
            HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Chauffeur chauffeur = new Chauffeur();
        chauffeur.setNom(nom);
        chauffeur.setPrenom(prenom);
        chauffeur.setTelephone(telephone);

        chauffeurService.saveChauffeur(chauffeur);
        return "redirect:/chauffeur/list";
    }

    @GetMapping("/details/{id}")
    public String showDetails(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Chauffeur chauffeur = chauffeurService.getChauffeurById(id);
        if (chauffeur == null) {
            return "redirect:/chauffeur/list";
        }

        model.addAttribute("chauffeur", chauffeur);
        model.addAttribute("pageTitle", "Détails du Chauffeur");
        model.addAttribute("contentPage", "/WEB-INF/jsp/chauffeur/details.jsp");
        return "includes/layout";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Chauffeur chauffeur = chauffeurService.getChauffeurById(id);
        if (chauffeur == null) {
            return "redirect:/chauffeur/list";
        }

        model.addAttribute("chauffeur", chauffeur);
        model.addAttribute("pageTitle", "Modifier le Chauffeur");
        model.addAttribute("contentPage", "/WEB-INF/jsp/chauffeur/edit.jsp");
        return "includes/layout";
    }

    @PostMapping("/edit/{id}")
    public String editChauffeur(
            @PathVariable Long id,
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam(value = "telephone", required = false) String telephone,
            HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Chauffeur chauffeur = chauffeurService.getChauffeurById(id);
        if (chauffeur == null) {
            return "redirect:/chauffeur/list";
        }

        chauffeur.setNom(nom);
        chauffeur.setPrenom(prenom);
        chauffeur.setTelephone(telephone);

        chauffeurService.saveChauffeur(chauffeur);
        return "redirect:/chauffeur/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteChauffeur(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Chauffeur chauffeur = chauffeurService.getChauffeurById(id);
        if (chauffeur != null) {
            chauffeurService.deleteChauffeur(id);
        }

        return "redirect:/chauffeur/list";
    }
}
