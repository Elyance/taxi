package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "vehicule")
public class Vehicule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vehicule")
    private Long idVehicule;

    @Column(name = "immatriculation", length = 50, nullable = false, unique = true)
    private String immatriculation;

    @Column(name = "nombre_place", nullable = false)
    private Integer nombrePlace;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_modele_vehicule", nullable = false)
    private ModeleVehicule modeleVehicule;
}