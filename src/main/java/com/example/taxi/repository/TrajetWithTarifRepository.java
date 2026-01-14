package com.example.taxi.repository;

import com.example.taxi.entity.TrajetWithTarif;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrajetWithTarifRepository extends JpaRepository<TrajetWithTarif, Long> {
}
