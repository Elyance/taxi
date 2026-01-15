package com.example.taxi.repository;

import com.example.taxi.entity.Commande;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CommandeRepository extends JpaRepository<Commande, Long> {

    @Query("SELECT c FROM Commande c WHERE c.client.idClient = :clientId")
    List<Commande> findByClientId(@Param("clientId") Long clientId);
}