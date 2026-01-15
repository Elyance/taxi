package com.example.taxi.service;

import com.example.taxi.entity.Vehicule;
import com.example.taxi.entity.ModeleVehicule;
import com.example.taxi.repository.VehiculeRepository;
import com.example.taxi.repository.ModeleVehiculeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class VehiculeService {

    @Autowired
    private VehiculeRepository vehiculeRepository;

    @Autowired
    private ModeleVehiculeRepository modeleVehiculeRepository;

    public List<Vehicule> getAllVehicules() {
        return vehiculeRepository.findAll();
    }

    public Vehicule getVehiculeById(Long id) {
        return vehiculeRepository.findById(id).orElse(null);
    }

    public Vehicule saveVehicule(Vehicule vehicule) {
        return vehiculeRepository.save(vehicule);
    }

    public void deleteVehicule(Long id) {
        vehiculeRepository.deleteById(id);
    }

    public List<ModeleVehicule> getAllModeles() {
        return modeleVehiculeRepository.findAll();
    }

    public ModeleVehicule getModeleById(Long id) {
        return modeleVehiculeRepository.findById(id).orElse(null);
    }

    public List<Vehicule> searchVehicules(String immatriculation, Integer nombrePlace, Long idModele) {
        return vehiculeRepository.searchVehicules(immatriculation, nombrePlace, idModele);
    }
}
