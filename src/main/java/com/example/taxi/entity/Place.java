package com.example.taxi.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "place")
public class Place {
    @Id
    @Column(name = "id_place")
    private Integer idPlace;

    @Column(length = 50)
    private String numero;

    @ManyToOne
    @JoinColumn(name = "id_modele_vehicule", nullable = false)
    private ModeleVehicule modeleVehicule;

    public Integer getIdPlace() { return idPlace; }
    public void setIdPlace(Integer idPlace) { this.idPlace = idPlace; }

    public String getNumero() { return numero; }
    public void setNumero(String numero) { this.numero = numero; }

    public ModeleVehicule getModeleVehicule() { return modeleVehicule; }
    public void setModeleVehicule(ModeleVehicule modeleVehicule) { this.modeleVehicule = modeleVehicule; }
}
