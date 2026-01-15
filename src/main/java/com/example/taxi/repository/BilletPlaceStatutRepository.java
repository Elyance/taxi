package com.example.taxi.repository;

import com.example.taxi.entity.BilletPlaceStatut;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BilletPlaceStatutRepository extends JpaRepository<BilletPlaceStatut, Long> {

    @Query(nativeQuery = true, value = "SELECT * FROM v_billet_place_statut WHERE " +
           "(cast(:idTrajet as bigint) is null or id_trajet = cast(:idTrajet as bigint)) AND " +
           "(cast(:dateDebut as timestamp) is null or date_voyage >= cast(:dateDebut as timestamp)) AND " +
           "(cast(:dateFin as timestamp) is null or date_voyage <= cast(:dateFin as timestamp)) AND " +
           "(:immatriculation is null or :immatriculation = '' or upper(immatriculation) ilike upper('%' || :immatriculation || '%'))")
    List<BilletPlaceStatut> searchBillets(@Param("idTrajet") Long idTrajet,
                                         @Param("dateDebut") LocalDateTime dateDebut,
                                         @Param("dateFin") LocalDateTime dateFin,
                                         @Param("immatriculation") String immatriculation);

    @Query(nativeQuery = true, value = "SELECT SUM(montant) FROM v_billet_place_statut WHERE " +
           "(cast(:idTrajet as bigint) is null or id_trajet = cast(:idTrajet as bigint)) AND " +
           "(cast(:dateDebut as timestamp) is null or date_voyage >= cast(:dateDebut as timestamp)) AND " +
           "(cast(:dateFin as timestamp) is null or date_voyage <= cast(:dateFin as timestamp)) AND " +
           "(:immatriculation is null or :immatriculation = '' or upper(immatriculation) ilike upper('%' || :immatriculation || '%'))")
    Double getChiffreAffaire(@Param("idTrajet") Long idTrajet,
                            @Param("dateDebut") LocalDateTime dateDebut,
                            @Param("dateFin") LocalDateTime dateFin,
                            @Param("immatriculation") String immatriculation);

    @Query(nativeQuery = true, value = "SELECT * FROM v_billet_place_statut WHERE id_voyage = :voyageId")
    List<BilletPlaceStatut> findByVoyageId(@Param("voyageId") Long voyageId);
}