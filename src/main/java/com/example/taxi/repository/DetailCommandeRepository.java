package com.example.taxi.repository;

import com.example.taxi.entity.DetailCommande;
import com.example.taxi.entity.Billet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface DetailCommandeRepository extends JpaRepository<DetailCommande, Long> {

    @Query("SELECT d.billet FROM DetailCommande d WHERE d.commande.idCommande = :commandeId")
    List<Billet> findBilletsByCommandeId(@Param("commandeId") Long commandeId);
}