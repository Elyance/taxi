package com.example.taxi.controller;

import com.example.taxi.entity.Vehicule;
import com.example.taxi.entity.ModeleVehicule;
import com.example.taxi.service.VehiculeService;
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
@RequestMapping("/vehicule")
public class VehiculeController {

    @Autowired
    private VehiculeService vehiculeService;

    @GetMapping("/list")
    public String listVehicules(
            @RequestParam(value = "immatriculation", required = false) String immatriculation,
            @RequestParam(value = "nombrePlace", required = false) Integer nombrePlace,
            @RequestParam(value = "idModele", required = false) Long idModele,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        List<Vehicule> vehicules;
        if ((immatriculation != null && !immatriculation.isEmpty()) ||
            (nombrePlace != null) ||
            (idModele != null && idModele > 0)) {
            vehicules = vehiculeService.searchVehicules(immatriculation, nombrePlace, idModele);
        } else {
            vehicules = vehiculeService.getAllVehicules();
        }

        model.addAttribute("vehicules", vehicules);
        model.addAttribute("modeles", vehiculeService.getAllModeles());
        model.addAttribute("pageTitle", "Gestion des Véhicules");
        model.addAttribute("contentPage", "/WEB-INF/jsp/vehicule/list.jsp");
        return "includes/layout";
    }

    @GetMapping("/create")
    public String showCreateForm(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        model.addAttribute("modeles", vehiculeService.getAllModeles());
        model.addAttribute("pageTitle", "Ajouter un Véhicule");
        model.addAttribute("contentPage", "/WEB-INF/jsp/vehicule/create.jsp");
        return "includes/layout";
    }

    @PostMapping("/create")
    public String createVehicule(
            @RequestParam("immatriculation") String immatriculation,
            @RequestParam("nombrePlace") Integer nombrePlace,
            @RequestParam(value = "idModele", required = false) Long idModele,
            HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Vehicule vehicule = new Vehicule();
        vehicule.setImmatriculation(immatriculation);
        vehicule.setNombrePlace(nombrePlace);

        if (idModele != null && idModele > 0) {
            ModeleVehicule modele = vehiculeService.getModeleById(idModele);
            vehicule.setModeleVehicule(modele);
        }

        vehiculeService.saveVehicule(vehicule);
        return "redirect:/vehicule/list";
    }

    @GetMapping("/details/{id}")
    public String showDetails(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Vehicule vehicule = vehiculeService.getVehiculeById(id);
        if (vehicule == null) {
            return "redirect:/vehicule/list";
        }

        model.addAttribute("vehicule", vehicule);
        model.addAttribute("pageTitle", "Détails du Véhicule");
        model.addAttribute("contentPage", "/WEB-INF/jsp/vehicule/details.jsp");
        return "includes/layout";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Vehicule vehicule = vehiculeService.getVehiculeById(id);
        if (vehicule == null) {
            return "redirect:/vehicule/list";
        }

        model.addAttribute("vehicule", vehicule);
        model.addAttribute("modeles", vehiculeService.getAllModeles());
        model.addAttribute("pageTitle", "Modifier le Véhicule");
        model.addAttribute("contentPage", "/WEB-INF/jsp/vehicule/edit.jsp");
        return "includes/layout";
    }

    @PostMapping("/edit/{id}")
    public String editVehicule(
            @PathVariable Long id,
            @RequestParam("immatriculation") String immatriculation,
            @RequestParam("nombrePlace") Integer nombrePlace,
            @RequestParam(value = "idModele", required = false) Long idModele,
            HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Vehicule vehicule = vehiculeService.getVehiculeById(id);
        if (vehicule == null) {
            return "redirect:/vehicule/list";
        }

        vehicule.setImmatriculation(immatriculation);
        vehicule.setNombrePlace(nombrePlace);

        if (idModele != null && idModele > 0) {
            ModeleVehicule modele = vehiculeService.getModeleById(idModele);
            vehicule.setModeleVehicule(modele);
        }

        vehiculeService.saveVehicule(vehicule);
        return "redirect:/vehicule/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteVehicule(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/";
        }

        Vehicule vehicule = vehiculeService.getVehiculeById(id);
        if (vehicule != null) {
            vehiculeService.deleteVehicule(id);
        }

        return "redirect:/vehicule/list";
    }
}
