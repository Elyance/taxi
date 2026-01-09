package com.example.taxi.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "statut_place")
public class StatutPlace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_statut_place")
    private Long idStatutPlace;

    @Column(length = 50)
    private String libelle;

    public Long getIdStatutPlace() { return idStatutPlace; }
    public void setIdStatutPlace(Long idStatutPlace) { this.idStatutPlace = idStatutPlace; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
}
