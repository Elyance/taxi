package com.example.taxi.repository;

import com.example.taxi.entity.Billet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BilletRepository extends JpaRepository<Billet, Long> {
    
    @Query("SELECT b FROM Billet b " +
           "JOIN FETCH b.client " +
           "JOIN FETCH b.voyage v " +
           "JOIN FETCH v.trajet t " +
           "JOIN FETCH t.gareDepart " +
           "JOIN FETCH t.gareArrivee " +
           "JOIN FETCH v.vehicule veh " +
           "JOIN FETCH b.place " +
           "JOIN FETCH b.statutBillet " +
           "WHERE (CAST(:dateDebut AS timestamp) IS NULL OR b.dateAchat >= :dateDebut) " +
           "AND (CAST(:dateFin AS timestamp) IS NULL OR b.dateAchat < :dateFin) " +
           "AND (:idVehicule IS NULL OR veh.idVehicule = :idVehicule) " +
           "ORDER BY b.dateAchat DESC")
    List<Billet> findBilletsWithFilters(
        @Param("dateDebut") LocalDateTime dateDebut,
        @Param("dateFin") LocalDateTime dateFin,
        @Param("idVehicule") Long idVehicule
    );
}
