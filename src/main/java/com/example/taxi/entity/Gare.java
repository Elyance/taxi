package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "gare")
public class Gare {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_gare")
    private Long idGare;

    @Column(name = "nom", length = 100, nullable = false)
    private String nom;
}