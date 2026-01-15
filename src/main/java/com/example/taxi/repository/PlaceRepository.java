package com.example.taxi.repository;

import com.example.taxi.entity.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PlaceRepository extends JpaRepository<Place, Long> {
    Place findByNumero(String numero);

    @Query("SELECT p FROM Place p ORDER BY p.idPlace")
    List<Place> findAllOrderedById();
}