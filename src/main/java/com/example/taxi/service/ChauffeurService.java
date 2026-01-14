package com.example.taxi.service;

import com.example.taxi.entity.Chauffeur;
import com.example.taxi.repository.ChauffeurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ChauffeurService {

    @Autowired
    private ChauffeurRepository chauffeurRepository;

    public List<Chauffeur> getAllChauffeurs() {
        return chauffeurRepository.findAll();
    }

    public Chauffeur getChauffeurById(Long id) {
        return chauffeurRepository.findById(id).orElse(null);
    }

    public Chauffeur saveChauffeur(Chauffeur chauffeur) {
        return chauffeurRepository.save(chauffeur);
    }

    public void deleteChauffeur(Long id) {
        chauffeurRepository.deleteById(id);
    }

    public List<Chauffeur> searchChauffeurs(String nom, String prenom) {
        List<Chauffeur> chauffeurs = chauffeurRepository.findAll();

        if (nom != null && !nom.isEmpty()) {
            chauffeurs = chauffeurs.stream()
                    .filter(c -> c.getNom().toUpperCase().contains(nom.toUpperCase()))
                    .toList();
        }

        if (prenom != null && !prenom.isEmpty()) {
            chauffeurs = chauffeurs.stream()
                    .filter(c -> c.getPrenom().toUpperCase().contains(prenom.toUpperCase()))
                    .toList();
        }

        return chauffeurs;
    }
}
