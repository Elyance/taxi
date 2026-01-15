package com.example.taxi.repository;

import com.example.taxi.entity.Billet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BilletRepository extends JpaRepository<Billet, Long> {

    @Query("SELECT b.place.numero FROM Billet b WHERE b.voyage.idVoyage = :voyageId")
    List<String> findReservedPlaceNumbersByVoyageId(@Param("voyageId") Long voyageId);
}