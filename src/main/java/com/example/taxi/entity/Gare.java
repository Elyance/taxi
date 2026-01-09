package com.example.taxi.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "gare")
public class Gare {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_gare")
    private Long idGare;

    @Column(nullable = false, length = 100)
    private String nom;

    public Long getIdGare() { return idGare; }
    public void setIdGare(Long idGare) { this.idGare = idGare; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
}
