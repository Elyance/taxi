package com.example.taxi.service;

import com.example.taxi.entity.Voyage;
import com.example.taxi.entity.VoyageDetails;
import com.example.taxi.entity.Chauffeur;
import com.example.taxi.entity.Vehicule;
import com.example.taxi.entity.Trajet;
import com.example.taxi.repository.VoyageRepository;
import com.example.taxi.repository.VoyageDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

@Service
public class VoyageService {

    @Autowired
    private VoyageRepository voyageRepository;

    @Autowired
    private VoyageDetailsRepository voyageDetailsRepository;

    @Autowired
    private ChauffeurService chauffeurService;

    @Autowired
    private VehiculeService vehiculeService;

    @Autowired
    private TrajetService trajetService;

    

    public Voyage getVoyageById(Long id) {
        return voyageRepository.findById(id).orElse(null);
    }

    public List<VoyageDetails> getAllVoyagesWithDetails() {
        return voyageDetailsRepository.findAll();
    }

    public void createVoyage(Long idChauffeur, Long idVehicule, Long idTrajet, String dateVoyageStr) throws Exception {
        // Valider les références en utilisant les services appropriés
        Chauffeur chauffeur = chauffeurService.getChauffeurById(idChauffeur);
        Vehicule vehicule = vehiculeService.getVehiculeById(idVehicule);
        Trajet trajet = trajetService.getTrajetById(idTrajet);

        if (chauffeur == null || vehicule == null || trajet == null) {
            throw new IllegalArgumentException("Références invalides (chauffeur, véhicule ou trajet)");
        }

        try {
            // Créer le voyage
            Voyage voyage = new Voyage();
            voyage.setChauffeur(chauffeur);
            voyage.setVehicule(vehicule);
            voyage.setTrajet(trajet);
            voyage.setDateVoyage(LocalDateTime.parse(dateVoyageStr));
            voyageRepository.save(voyage);
        } catch (Exception e) {
            throw new IllegalArgumentException("Date invalide ou erreur lors de la création du voyage");
        }
    }

    public void deleteVoyage(Long id) {
        Voyage voyage = voyageRepository.findById(id).orElse(null);
        if (voyage != null) {
            voyageRepository.deleteById(id);
        }
    }

    public List<VoyageDetails> searchVoyages(Long idTrajet, String date) {
        return voyageDetailsRepository.searchVoyages(idTrajet, date);
    }

    
    public BigDecimal getTarifForVoyage(Long voyageId) {
        Voyage voyage = getVoyageById(voyageId);
        if (voyage != null && voyage.getTrajet() != null) {
            return trajetService.getTarifForTrajet(voyage.getTrajet().getIdTrajet());
        }
        return BigDecimal.ZERO;
    }
}