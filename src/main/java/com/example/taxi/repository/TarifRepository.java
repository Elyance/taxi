package com.example.taxi.repository;

import com.example.taxi.entity.Tarif;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.math.BigDecimal;

@Repository
public interface TarifRepository extends JpaRepository<Tarif, Long> {

    @Query("SELECT t.prixBase FROM Tarif t WHERE t.trajet.idTrajet = :trajetId")
    BigDecimal findPrixBaseByTrajetId(@Param("trajetId") Long trajetId);
}