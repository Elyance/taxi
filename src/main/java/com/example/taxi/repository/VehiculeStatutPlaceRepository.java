package com.example.taxi.repository;

import com.example.taxi.entity.VehiculeStatutPlace;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VehiculeStatutPlaceRepository extends JpaRepository<VehiculeStatutPlace, Long> {
    
    @Query("SELECT vsp FROM VehiculeStatutPlace vsp " +
           "JOIN FETCH vsp.place p " +
           "JOIN FETCH vsp.statutPlace " +
           "WHERE vsp.vehicule.idVehicule = :idVehicule " +
           "ORDER BY p.numero")
    List<VehiculeStatutPlace> findByVehiculeIdVehiculeWithDetails(@Param("idVehicule") Long idVehicule);
}
