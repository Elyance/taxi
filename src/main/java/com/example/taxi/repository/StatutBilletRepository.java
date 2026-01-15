package com.example.taxi.repository;

import com.example.taxi.entity.StatutBillet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StatutBilletRepository extends JpaRepository<StatutBillet, Long> {

    @Query("SELECT s FROM StatutBillet s WHERE s.libelle = :libelle")
    StatutBillet findByLibelle(@Param("libelle") String libelle);
}