package com.example.taxi.repository;

import com.example.taxi.entity.Tarif;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TarifRepository extends JpaRepository<Tarif, Long> {
    Optional<Tarif> findByTrajetIdTrajet(Long idTrajet);
}
