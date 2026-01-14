package com.example.taxi.service;

import com.example.taxi.entity.Admin;
import com.example.taxi.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public Admin authenticate(String nomUtilisateur, String mdp) {
        if (nomUtilisateur == null || mdp == null || nomUtilisateur.trim().isEmpty() || mdp.trim().isEmpty()) {
            return null;
        }

        Optional<Admin> adminOpt = adminRepository.findByNom(nomUtilisateur.trim());
        if (adminOpt.isPresent()) {
            Admin admin = adminOpt.get();
            // En production, utiliser un hashage sécurisé (BCrypt)
            if (mdp.equals(admin.getMdp())) {
                return admin;
            }
        }
        return null;
    }

    public Optional<Admin> findById(Long id) {
        return adminRepository.findById(id);
    }

    public Admin save(Admin admin) {
        return adminRepository.save(admin);
    }
}