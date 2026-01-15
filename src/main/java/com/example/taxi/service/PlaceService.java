package com.example.taxi.service;

import com.example.taxi.entity.*;
import com.example.taxi.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class PlaceService {

    @Autowired
    private BilletRepository billetRepository;
    
    @Autowired
    private PlaceRepository placeRepository;
    
    @Autowired
    private VoyageRepository voyageRepository;

    @Autowired
    private StatutBilletRepository statutBilletRepository;

    @Autowired
    private BilletPlaceStatutRepository billetPlaceStatutRepository;

    /**
     * Récupère les places réservées pour un voyage donné avec toutes les informations détaillées
     */
    public List<BilletPlaceStatut> getReservedPlacesForVoyage(Long voyageId) {
        return billetPlaceStatutRepository.findByVoyageId(voyageId);
    }
    
    /**
     * Parse les places sélectionnées depuis une chaîne séparée par des virgules
     * Exemple: "1,5,12"
     */
    public List<Long> parseSelectedPlaces(String selectedPlacesString) {
        List<Long> places = new ArrayList<>();
        if (selectedPlacesString != null && !selectedPlacesString.isEmpty()) {
            String[] parts = selectedPlacesString.split(",");
            for (String part : parts) {
                try {
                    places.add(Long.parseLong(part.trim()));
                } catch (NumberFormatException e) {
                    // Ignorer les valeurs invalides
                }
            }
        }
        return places;
    }
    
    /**
     * Crée les billets pour les places sélectionnées
     */
    public List<Billet> createBilletsForPlaces(Long voyageId, List<Long> placeNumbers, Client client, BigDecimal montant) throws Exception {
        Voyage voyage = voyageRepository.findById(voyageId)
            .orElseThrow(() -> new Exception("Voyage non trouvé"));
        
        List<Billet> billets = new ArrayList<>();
        
        for (Long placeNumber : placeNumbers) {
            // Construire le numéro de place au format P001, P002, etc.
            String placeNumero = String.format("P%03d", placeNumber);
            
            // Récupérer la place
            Place place = placeRepository.findByNumero(placeNumero);
            if (place == null) {
                throw new Exception("Place " + placeNumero + " non trouvée");
            }
            
            // Créer le billet
            Billet billet = new Billet();
            billet.setVoyage(voyage);
            billet.setPlace(place);
            billet.setClient(client);
            billet.setMontant(montant != null ? montant.divide(BigDecimal.valueOf(placeNumbers.size())) : BigDecimal.ZERO);
            billet.setStatutBillet(statutBilletRepository.findById(1L).orElse(null)); // ou une valeur par défaut
            
            Billet saved = billetRepository.save(billet);
            billets.add(saved);
        }
        
        return billets;
    }

    /**
     * Récupère toutes les places d'un voyage avec leur statut (réservée ou disponible)
     */
    public List<PlaceInfo> getAllPlacesWithStatusForVoyage(Long voyageId) {
        // Récupérer le voyage pour connaître le nombre de places
        Voyage voyage = voyageRepository.findById(voyageId).orElse(null);
        if (voyage == null) {
            return new ArrayList<>();
        }

        // Récupérer les places réservées
        List<BilletPlaceStatut> reservedPlaces = getReservedPlacesForVoyage(voyageId);

        // Créer un set des numéros de places réservées (statuts 1, 2, 3)
        Set<Integer> reservedPlaceNumbers = new HashSet<>();
        for (BilletPlaceStatut billet : reservedPlaces) {
            if (billet.getIdStatutBillet() != null &&
                (billet.getIdStatutBillet() == 1 || billet.getIdStatutBillet() == 2 || billet.getIdStatutBillet() == 3)) {
                reservedPlaceNumbers.add(billet.getNumeroPlace());
            }
        }
       

        // Récupérer toutes les places ordonnées par ID
        List<Place> allPlaces = placeRepository.findAllOrderedById();

        // Limiter au nombre de places du véhicule
        int nbPlaces = voyage.getVehicule().getNombrePlace();
        if (allPlaces.size() > nbPlaces) {
            allPlaces = allPlaces.subList(0, nbPlaces);
        }


        // Créer la liste de PlaceInfo
        List<PlaceInfo> placesWithStatus = new ArrayList<>();
        for (Place place : allPlaces) {
            int numeroPlace = Integer.parseInt(place.getNumero().substring(1)); // Enlever le "P" et convertir
            boolean isReserved = reservedPlaceNumbers.contains(numeroPlace);
            placesWithStatus.add(new PlaceInfo(numeroPlace, isReserved));
        }

        return placesWithStatus;
    }

    /**
     * Récupère le tarif pour un voyage donné
     */
    public BigDecimal getTarifForVoyage(Long voyageId) {
        List<BilletPlaceStatut> reservedPlaces = getReservedPlacesForVoyage(voyageId);
        return reservedPlaces.isEmpty() ? null : reservedPlaces.get(0).getTarifTrajet();
    }
}

