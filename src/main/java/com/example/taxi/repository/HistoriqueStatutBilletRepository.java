package com.example.taxi.repository;

import com.example.taxi.entity.HistoriqueStatutBillet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HistoriqueStatutBilletRepository extends JpaRepository<HistoriqueStatutBillet, Long> {
}