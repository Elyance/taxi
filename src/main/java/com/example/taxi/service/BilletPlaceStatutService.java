package com.example.taxi.service;

import com.example.taxi.entity.Billet;
import com.example.taxi.entity.BilletPlaceStatut;
import com.example.taxi.repository.BilletPlaceStatutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class BilletPlaceStatutService {

    @Autowired
    private BilletPlaceStatutRepository billetPlaceStatutRepository;

    public List<BilletPlaceStatut> getAllBillets() {
        return billetPlaceStatutRepository.findAll();
    }

    public List<BilletPlaceStatut> searchBillets(Long idTrajet, LocalDateTime dateDebut, LocalDateTime dateFin, String immatriculation) {
        return billetPlaceStatutRepository.searchBillets(idTrajet, dateDebut, dateFin, immatriculation);
    }

    public BigDecimal getChiffreAffaire(Long idTrajet, LocalDateTime dateDebut, LocalDateTime dateFin, String immatriculation) {
        Double total = billetPlaceStatutRepository.getChiffreAffaire(idTrajet, dateDebut, dateFin, immatriculation);
        return total != null ? BigDecimal.valueOf(total) : BigDecimal.ZERO;
    }

    public BilletPlaceStatut getBilletById(Long id) {
        return billetPlaceStatutRepository.findById(id).orElse(null);
    }

    public BilletPlaceStatut findById(Long id) {
        return billetPlaceStatutRepository.findById(id).orElse(null);
    }
}