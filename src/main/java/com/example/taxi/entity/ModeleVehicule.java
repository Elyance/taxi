package com.example.taxi.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "modele_vehicule")
public class ModeleVehicule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_modele_vehicule")
    private Long idModeleVehicule;

    @Column(nullable = false, length = 100)
    private String libelle;

    @Column(name = "nombre_place", nullable = false)
    private Integer nombrePlace;

    public Long getIdModeleVehicule() { return idModeleVehicule; }
    public void setIdModeleVehicule(Long idModeleVehicule) { this.idModeleVehicule = idModeleVehicule; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }

    public Integer getNombrePlace() { return nombrePlace; }
    public void setNombrePlace(Integer nombrePlace) { this.nombrePlace = nombrePlace; }
}
