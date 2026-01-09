package com.example.taxi.controller;

import com.example.taxi.entity.Voyage;
import com.example.taxi.entity.VehiculeStatutPlace;
import com.example.taxi.service.VoyageService;
import com.example.taxi.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/voyages")
public class VoyageController {

    @Autowired
    private VoyageService voyageService;

    @Autowired
    private PlaceService placeService;

    @GetMapping
    public String listVoyages(
            @RequestParam(name = "date", required = false) 
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
            Model model) {
        
        // Si aucune date n'est fournie, utiliser la date du jour
        if (date == null) {
            date = LocalDate.now();
        }
        
        List<Voyage> voyages = voyageService.getVoyagesByDate(date);
        model.addAttribute("voyages", voyages);
        model.addAttribute("dateRecherche", date);
        
        return "voyage/list";
    }

    @GetMapping("/{idVoyage}/places")
    public String listPlaces(@PathVariable Long idVoyage, Model model) {
        List<VehiculeStatutPlace> places = placeService.getPlacesByVoyage(idVoyage);
        model.addAttribute("places", places);
        model.addAttribute("idVoyage", idVoyage);
        
        return "voyage/place-list";
    }
}
