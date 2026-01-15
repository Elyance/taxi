package com.example.taxi.repository;

import com.example.taxi.entity.Chauffeur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ChauffeurRepository extends JpaRepository<Chauffeur, Long> {

    @Query("SELECT c FROM Chauffeur c WHERE " +
           "(:nom IS NULL OR :nom = '' OR UPPER(c.nom) LIKE UPPER(CONCAT('%', :nom, '%'))) AND " +
           "(:prenom IS NULL OR :prenom = '' OR UPPER(c.prenom) LIKE UPPER(CONCAT('%', :prenom, '%')))")
    List<Chauffeur> searchChauffeurs(@Param("nom") String nom, @Param("prenom") String prenom);
}