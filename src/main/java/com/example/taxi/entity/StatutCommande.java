package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "statut_commande")
public class StatutCommande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_statut_commande")
    private Long idStatutCommande;

    @Column(name = "libelle", length = 50)
    private String libelle;

    public Long getIdStatutCommande() {
        return idStatutCommande;
    }

    public void setIdStatutCommande(Long idStatutCommande) {
        this.idStatutCommande = idStatutCommande;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    
}