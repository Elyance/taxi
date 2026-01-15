package com.example.taxi.repository;

import com.example.taxi.entity.VoyageDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface VoyageDetailsRepository extends JpaRepository<VoyageDetails, Long> {

    @Query("SELECT v FROM VoyageDetails v WHERE " +
           "(:idTrajet IS NULL OR :idTrajet = 0 OR v.idTrajet = :idTrajet) AND " +
           "(:date IS NULL OR :date = '' OR CAST(v.dateVoyage AS string) LIKE CONCAT(:date, '%'))")
    List<VoyageDetails> searchVoyages(@Param("idTrajet") Long idTrajet, @Param("date") String date);
}
