package com.example.taxi.repository;

import com.example.taxi.entity.StatutBillet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatutBilletRepository extends JpaRepository<StatutBillet, Long> {
}