package com.example.taxi.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "place")
public class Place {
    @Id
    @Column(name = "id_place")
    private Long idPlace;

    @Column(name = "numero", length = 50)
    private String numero;
}