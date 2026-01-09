package com.example.taxi.repository;

import com.example.taxi.entity.Voyage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface VoyageRepository extends JpaRepository<Voyage, Long> {
    
    @Query("SELECT v FROM Voyage v " +
           "JOIN FETCH v.trajet t " +
           "JOIN FETCH t.gareDepart " +
           "JOIN FETCH t.gareArrivee " +
           "JOIN FETCH v.vehicule ve " +
           "JOIN FETCH ve.modeleVehicule " +
           "JOIN FETCH v.chauffeur " +
           "WHERE CAST(v.dateVoyage AS date) = :date " +
           "ORDER BY v.dateVoyage")
    List<Voyage> findVoyagesByDate(@Param("date") LocalDate date);
}
