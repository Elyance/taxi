package com.example.taxi.repository;

import com.example.taxi.entity.ModePaiement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ModePaiementRepository extends JpaRepository<ModePaiement, Long> {

    @Query("SELECT m FROM ModePaiement m WHERE m.libelle = :libelle")
    ModePaiement findByLibelle(@Param("libelle") String libelle);
}