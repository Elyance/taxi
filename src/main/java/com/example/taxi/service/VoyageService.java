package com.example.taxi.service;

import com.example.taxi.entity.Voyage;
import com.example.taxi.repository.VoyageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class VoyageService {

    @Autowired
    private VoyageRepository voyageRepository;

    public List<Voyage> getVoyagesByDate(LocalDate date) {
        return voyageRepository.findVoyagesByDate(date);
    }
}
