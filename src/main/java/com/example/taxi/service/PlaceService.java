package com.example.taxi.service;

import com.example.taxi.entity.VehiculeStatutPlace;
import com.example.taxi.entity.Voyage;
import com.example.taxi.repository.VehiculeStatutPlaceRepository;
import com.example.taxi.repository.VoyageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PlaceService {

    @Autowired
    private VehiculeStatutPlaceRepository vehiculeStatutPlaceRepository;

    @Autowired
    private VoyageRepository voyageRepository;

    public List<VehiculeStatutPlace> getPlacesByVoyage(Long idVoyage) {
        Optional<Voyage> voyage = voyageRepository.findById(idVoyage);
        if (voyage.isPresent()) {
            Long idVehicule = voyage.get().getVehicule().getIdVehicule();
            return vehiculeStatutPlaceRepository.findByVehiculeIdVehiculeWithDetails(idVehicule);
        }
        return List.of();
    }
}
