package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "mode_paiement")
public class ModePaiement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_mode_paiement")
    private Long idModePaiement;

    @Column(name = "libelle", length = 50)
    private String libelle;

    public Long getIdModePaiement() {
        return idModePaiement;
    }

    public void setIdModePaiement(Long idModePaiement) {
        this.idModePaiement = idModePaiement;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    
}