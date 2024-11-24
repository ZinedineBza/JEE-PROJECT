package jeeprojet.application.Modele;

import javax.persistence.*;

@Entity
@Table(name = "cours")
public class Cour {
    @EmbeddedId
    private CourId id;

    @MapsId("enseignant")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "enseignant", nullable = false)
    private Utilisateur enseignant;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "nom", nullable = false)
    private Matiere matiere;

    @Column(name = "salle", length = 5)
    private String salle;

    // Getters et setters...

    @Override
    public String toString() {
        return "Cour{" +
                "id=" + id +
                ", enseignant=" + (enseignant != null ? enseignant.getNom() + " " + enseignant.getPrenom() : "null") +
                ", nom=" + (matiere != null ? matiere.getNom() : "null") +
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