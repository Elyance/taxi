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
        List<Vehicule> vehicules = vehiculeRepository.findAll();

        if (immatriculation != null && !immatriculation.isEmpty()) {
            vehicules = vehicules.stream()
                    .filter(v -> v.getImmatriculation().toUpperCase().contains(immatriculation.toUpperCase()))
                    .toList();
        }

        if (nombrePlace != null && nombrePlace > 0) {
            vehicules = vehicules.stream()
                    .filter(v -> v.getNombrePlace() >= nombrePlace)
                    .toList();
        }

        if (idModele != null && idModele > 0) {
            vehicules = vehicules.stream()
                    .filter(v -> v.getModeleVehicule() != null && v.getModeleVehicule().getIdModeleVehicule().equals(idModele))
                    .toList();
        }

        return vehicules;
    }
}
