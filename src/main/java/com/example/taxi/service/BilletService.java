package com.example.taxi.service;

import com.example.taxi.entity.*;
import com.example.taxi.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List;

@Service
public class BilletService {

    @Autowired
    private BilletRepository billetRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private VoyageRepository voyageRepository;

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private StatutBilletRepository statutBilletRepository;

    @Autowired
    private VehiculeStatutPlaceRepository vehiculeStatutPlaceRepository;

    @Autowired
    private PaiementRepository paiementRepository;

    @Transactional
    public Billet creerBillet(Long idClient, String nomClient, String telephoneClient, 
                              Long idVoyage, Integer idPlace, BigDecimal montant) {
        
        Client client;
        
        // Si idClient est fourni, on récupère le client existant
        if (idClient != null) {
            Optional<Client> existingClient = clientRepository.findById(idClient);
            if (existingClient.isPresent()) {
                client = existingClient.get();
            } else {
                throw new RuntimeException("Client non trouvé avec l'ID: " + idClient);
            }
        } else {
            // Sinon, on crée un nouveau client
            client = new Client();
            client.setNom(nomClient);
            client.setTelephone(telephoneClient);
            client = clientRepository.save(client);
        }

        // Récupérer le voyage
        Voyage voyage = voyageRepository.findById(idVoyage)
                .orElseThrow(() -> new RuntimeException("Voyage non trouvé"));

        // Récupérer la place
        Place place = placeRepository.findById(idPlace)
                .orElseThrow(() -> new RuntimeException("Place non trouvée"));

        // Récupérer le statut "Confirmé" (ID 1 par défaut)
        StatutBillet statutBillet = statutBilletRepository.findById(1L)
                .orElse(null);

        // Créer le billet
        Billet billet = new Billet();
        billet.setClient(client);
        billet.setVoyage(voyage);
        billet.setPlace(place);
        billet.setStatutBillet(statutBillet);
        billet.setDateAchat(LocalDateTime.now());
        billet.setMontant(montant);

        // Sauvegarder le billet
        Billet savedBillet = billetRepository.save(billet);

        // Créer le paiement
        Paiement paiement = new Paiement();
        paiement.setBillet(savedBillet);
        paiement.setMontant(montant);
        paiement.setDatePaiement(LocalDateTime.now());
        paiementRepository.save(paiement);

        // Mettre à jour le statut de la place à "Occupé" (ID 3)
        VehiculeStatutPlace vsp = vehiculeStatutPlaceRepository
                .findByVehiculeIdVehiculeWithDetails(voyage.getVehicule().getIdVehicule())
                .stream()
                .filter(v -> v.getPlace().getIdPlace().equals(idPlace))
                .findFirst()
                .orElse(null);

        if (vsp != null) {
            StatutPlace statutOccupe = new StatutPlace();
            statutOccupe.setIdStatutPlace(3L); // Occupé
            vsp.setStatutPlace(statutOccupe);
            vehiculeStatutPlaceRepository.save(vsp);
        }

        return savedBillet;
    }

    public Optional<Billet> getBilletById(Long id) {
        return billetRepository.findById(id);
    }

    public List<Billet> getAllBillets() {
        return billetRepository.findAll();
    }
    
    public List<Billet> getBilletsWithFilters(LocalDateTime dateHeure, Long idVehicule) {
        LocalDateTime dateDebut = null;
        LocalDateTime dateFin = null;
        
        if (dateHeure != null) {
            // Début de l'heure sélectionnée
            dateDebut = dateHeure.withMinute(0).withSecond(0).withNano(0);
            // Fin de l'heure sélectionnée (début de l'heure suivante)
            dateFin = dateDebut.plusHours(1);
        }
        
        return billetRepository.findBilletsWithFilters(dateDebut, dateFin, idVehicule);
    }
}
