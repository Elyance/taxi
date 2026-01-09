package com.example.taxi.service;

import com.example.taxi.entity.Admin;
import com.example.taxi.repository.AdminRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;

    public Admin login(String nom, String mdp) {
        return adminRepository.findByNomAndMotDePasse(nom, mdp)
                .orElse(null);
    }
}
