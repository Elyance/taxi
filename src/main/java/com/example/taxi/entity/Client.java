package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "client")
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_client")
    private Long idClient;

    @Column(name = "nom", length = 50)
    private String nom;

    @Column(name = "telephone", length = 50)
    private String telephone;
}