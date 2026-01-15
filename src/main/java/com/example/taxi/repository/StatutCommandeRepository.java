package com.example.taxi.repository;

import com.example.taxi.entity.StatutCommande;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StatutCommandeRepository extends JpaRepository<StatutCommande, Long> {

    @Query("SELECT s FROM StatutCommande s WHERE s.libelle = :libelle")
    StatutCommande findByLibelle(@Param("libelle") String libelle);
}