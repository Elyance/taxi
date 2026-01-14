package com.example.taxi.repository;

import com.example.taxi.entity.ModeleVehicule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ModeleVehiculeRepository extends JpaRepository<ModeleVehicule, Long> {
}