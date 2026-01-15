package com.example.taxi.service;

import com.example.taxi.entity.ModePaiement;
import com.example.taxi.repository.ModePaiementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ModePaiementService {

    @Autowired
    private ModePaiementRepository modePaiementRepository;

    public List<ModePaiement> getAllModesPaiement() {
        return modePaiementRepository.findAll();
    }

    public ModePaiement getModePaiementById(Long id) {
        return modePaiementRepository.findById(id).orElse(null);
    }

    public ModePaiement getModePaiementByLibelle(String libelle) {
        return modePaiementRepository.findByLibelle(libelle);
    }
}
