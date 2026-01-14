package com.example.taxi.service;

import com.example.taxi.entity.Trajet;
import com.example.taxi.entity.Tarif;
import com.example.taxi.entity.TrajetWithTarif;
import com.example.taxi.entity.Gare;
import com.example.taxi.repository.TrajetRepository;
import com.example.taxi.repository.TarifRepository;
import com.example.taxi.repository.TrajetWithTarifRepository;
import com.example.taxi.repository.GareRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;
import java.math.BigDecimal;

@Service
public class TrajetService {

    @Autowired
    private TrajetRepository trajetRepository;

    @Autowired
    private TarifRepository tarifRepository;

    @Autowired
    private TrajetWithTarifRepository trajetWithTarifRepository;

    @Autowired
    private GareRepository gareRepository;

    public List<Trajet> getAllTrajets() {
        return trajetRepository.findAll();
    }

    public Trajet getTrajetById(Long id) {
        return trajetRepository.findById(id).orElse(null);
    }

    public List<TrajetWithTarif> getAllTrajetsWithTarif() {
        return trajetWithTarifRepository.findAll();
    }

    public List<TrajetWithTarif> searchTrajets(Long idGareDepart, Long idGareArrivee, String prixMin, String prixMax) {
        List<TrajetWithTarif> trajets = trajetWithTarifRepository.findAll();

        return trajets.stream()
                .filter(t -> idGareDepart == null || idGareDepart == 0 || t.getIdTrajet() > 0 && existTrajetWithDeparture(t.getIdTrajet(), idGareDepart))
                .filter(t -> idGareArrivee == null || idGareArrivee == 0 || existTrajetWithArrival(t.getIdTrajet(), idGareArrivee))
                .filter(t -> {
                    if (prixMin == null || prixMin.isEmpty()) return true;
                    try {
                        BigDecimal minPrice = new BigDecimal(prixMin);
                        return t.getTarifPrix() != null && t.getTarifPrix().compareTo(minPrice) >= 0;
                    } catch (NumberFormatException e) {
                        return true;
                    }
                })
                .filter(t -> {
                    if (prixMax == null || prixMax.isEmpty()) return true;
                    try {
                        BigDecimal maxPrice = new BigDecimal(prixMax);
                        return t.getTarifPrix() != null && t.getTarifPrix().compareTo(maxPrice) <= 0;
                    } catch (NumberFormatException e) {
                        return true;
                    }
                })
                .collect(Collectors.toList());
    }

    private boolean existTrajetWithDeparture(Long trajetId, Long idGareDepart) {
        Trajet trajet = trajetRepository.findById(trajetId).orElse(null);
        return trajet != null && trajet.getGareDepart() != null && trajet.getGareDepart().getIdGare().equals(idGareDepart);
    }

    private boolean existTrajetWithArrival(Long trajetId, Long idGareArrivee) {
        Trajet trajet = trajetRepository.findById(trajetId).orElse(null);
        return trajet != null && trajet.getGareArrivee() != null && trajet.getGareArrivee().getIdGare().equals(idGareArrivee);
    }

    public List<Gare> getAllGares() {
        return gareRepository.findAll();
    }

    public Gare getGareById(Long id) {
        return gareRepository.findById(id).orElse(null);
    }

    public void createTrajet(Long idGareDepart, Long idGareArrivee, String tarifPrixStr) throws Exception {
        // Valider les gares
        Gare gareDepart = gareRepository.findById(idGareDepart).orElse(null);
        Gare gareArrivee = gareRepository.findById(idGareArrivee).orElse(null);

        if (gareDepart == null || gareArrivee == null) {
            throw new IllegalArgumentException("Gares invalides");
        }

        // Créer le trajet
        Trajet trajet = new Trajet();
        trajet.setGareDepart(gareDepart);
        trajet.setGareArrivee(gareArrivee);
        Trajet savedTrajet = trajetRepository.save(trajet);

        // Créer et sauvegarder le tarif associé
        if (tarifPrixStr != null && !tarifPrixStr.isEmpty()) {
            try {
                BigDecimal tarifPrix = new BigDecimal(tarifPrixStr);
                if (tarifPrix.compareTo(BigDecimal.ZERO) > 0) {
                    Tarif tarif = new Tarif();
                    tarif.setTrajet(savedTrajet);
                    tarif.setPrixBase(tarifPrix);
                    tarifRepository.save(tarif);
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Tarif invalide");
            }
        }
    }

    public void deleteTrajet(Long id) {
        Trajet trajet = trajetRepository.findById(id).orElse(null);
        if (trajet != null) {
            trajetRepository.deleteById(id);
        }
    }
}


