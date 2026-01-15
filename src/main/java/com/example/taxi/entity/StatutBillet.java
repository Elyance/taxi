package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "statut_billet")
public class StatutBillet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_statut_billet")
    private Long idStatutBillet;

    @Column(name = "libelle", length = 50)
    private String libelle;

    public Long getIdStatutBillet() {
        return idStatutBillet;
    }

    public void setIdStatutBillet(Long idStatutBillet) {
        this.idStatutBillet = idStatutBillet;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    
}