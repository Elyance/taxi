package com.example.taxi.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "vehicule")
public class Vehicule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_vehicule")
    private Long idVehicule;

    @Column(nullable = false, unique = true, length = 50)
    private String immatriculation;

    @ManyToOne
    @JoinColumn(name = "id_modele_vehicule", nullable = false)
    private ModeleVehicule modeleVehicule;

    public Long getIdVehicule() { return idVehicule; }
    public void setIdVehicule(Long idVehicule) { this.idVehicule = idVehicule; }

    public String getImmatriculation() { return immatriculation; }
    public void setImmatriculation(String immatriculation) { this.immatriculation = immatriculation; }

    public ModeleVehicule getModeleVehicule() { return modeleVehicule; }
    public void setModeleVehicule(ModeleVehicule modeleVehicule) { this.modeleVehicule = modeleVehicule; }
}
