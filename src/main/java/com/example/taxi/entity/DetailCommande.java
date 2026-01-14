package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "detail_commande")
public class DetailCommande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_detail_commande")
    private Long idDetailCommande;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_commande", nullable = false)
    private Commande commande;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_billet", nullable = false)
    private Billet billet;
}