package com.example.taxi.repository;

import com.example.taxi.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, Long> {
    Optional<Admin> findByNomAndMotDePasse(String nom, String motDePasse);
}
