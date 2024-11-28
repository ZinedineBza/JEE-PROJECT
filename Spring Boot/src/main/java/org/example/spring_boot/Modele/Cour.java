package org.example.spring_boot.Modele;

import jakarta.persistence.*;

import java.util.Optional;

@Entity
@Table(name = "cours")
public class Cour {

    @EmbeddedId
    private CourId id; // Clé composite

    @MapsId("enseignant") // Associe la clé composite au champ enseignant
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "enseignant", nullable = false)
    private Utilisateur enseignant;

    @ManyToOne(fetch = FetchType.EAGER, optional = false) // Relation avec Matiere
    @JoinColumn(name = "matiere", nullable = false)
    private Optional<Matiere> matiere;

    @Column(name = "salle", length = 5) // Salle de cours
    private String salle;

    // Getters et setters
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

    public Optional<Matiere> getMatiere() {
        return matiere;
    }

    public void setMatiere(Optional<Matiere> matiere) {
        this.matiere = matiere;
    }

    public String getSalle() {
        return salle;
    }

    public void setSalle(String salle) {
        this.salle = salle;
    }

    @Override
    public String toString() {
        return "Cour{" +
                "id=" + id +
                ", enseignant=" + (enseignant != null ? enseignant.getNom() + " " + enseignant.getPrenom() : "null") +
                ", matiere=" + (matiere.isPresent() ? matiere.get().getNom() : "null") +
                ", salle='" + salle + '\'' +
                '}';
    }
}
