package com.example.taxi.repository;

import com.example.taxi.entity.Paiement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PaiementRepository extends JpaRepository<Paiement, Long> {

    @Query("SELECT p FROM Paiement p WHERE p.commande.idCommande = :commandeId")
    List<Paiement> findByCommandeId(@Param("commandeId") Long commandeId);
}