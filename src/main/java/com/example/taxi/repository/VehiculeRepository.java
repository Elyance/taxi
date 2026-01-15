package com.example.taxi.repository;

import com.example.taxi.entity.Vehicule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface VehiculeRepository extends JpaRepository<Vehicule, Long> {

    @Query("SELECT v FROM Vehicule v WHERE " +
           "(:immatriculation IS NULL OR :immatriculation = '' OR UPPER(v.immatriculation) LIKE UPPER(CONCAT('%', :immatriculation, '%'))) AND " +
           "(:nombrePlace IS NULL OR :nombrePlace <= 0 OR v.nombrePlace >= :nombrePlace) AND " +
           "(:idModele IS NULL OR :idModele <= 0 OR v.modeleVehicule.idModeleVehicule = :idModele)")
    List<Vehicule> searchVehicules(@Param("immatriculation") String immatriculation,
                                  @Param("nombrePlace") Integer nombrePlace,
                                  @Param("idModele") Long idModele);
}