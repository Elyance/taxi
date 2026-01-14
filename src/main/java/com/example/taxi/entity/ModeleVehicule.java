package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "modele_vehicule")
public class ModeleVehicule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_modele_vehicule")
    private Long idModeleVehicule;

    @Column(name = "libelle", length = 100, nullable = false)
    private String libelle;
}