package com.example.javaee.model;

import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "cours")
public class Cour {
    @EmbeddedId
    private CourId id;

    @MapsId("enseignant")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "enseignant", nullable = false)
    private Utilisateur enseignant;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "matiere", nullable = false)
    private Matiere matiere;

    @Column(name = "salle", length = 5)
    private String salle;

    @Override
    public String toString() {
        return "Cour{" +
                "id=" + id +
                ", enseignant=" + (enseignant != null ? enseignant.getNom() + " " + enseignant.getPrenom() : "null") +
                ", nom=" + (matiere != null ? matiere.getNom() : "null") + // Afficher le nom de la matière
                ", salle='" + salle + '\'' +
                '}';
    }



    public CourId getId() {
        return id;
    }

    public void setId(CourId id) {
        this.id = id;
    }

    public Utilisateur getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Utilisateur enseignant) {
        this.enseignant = enseignant;
    }

    public Matiere getNom() {
        return matiere;
    }

    public void setNom(Matiere nom) {
        this.matiere = nom;
    }

    public String getSalle() {
        return salle;
    }

    public void setSalle(String salle) {
        this.salle = salle;
    }


}