package org.example.spring_boot.Modele;

import jakarta.persistence.*;

import java.util.Optional;

@Entity
@Table(name = "resultat")
public class Resultat {

    @EmbeddedId
    private ResultatId id; // Clé composite

    @MapsId("etudiant") // Associe la clé composite au champ etudiant
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant; // Relation avec Utilisateur

    @MapsId("matiere") // Associe la clé composite au champ matiere
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "matiere", referencedColumnName = "nom", nullable = false)
    private Matiere cours; // Relation avec Matiere

    @Column(name = "note")
    private Float note; // Note de l'étudiant

    @Lob
    @Column(name = "commentaire")
    private String commentaire; // Commentaire associé au résultat

    // Getters et setters
    public ResultatId getId() {
        return id;
    }

    public void setId(ResultatId id) {
        this.id = id;
    }

    public Utilisateur getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Optional<Utilisateur> etudiant) {
        this.etudiant = etudiant;
    }

    public Matiere getCours() {
        return cours;
    }

    public void setCours(Optional<Matiere> cours) {
        this.cours = cours;
    }

    public Float getNote() {
        return note;
    }

    public void setNote(Float note) {
        this.note = note;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    @Override
    public String toString() {
        return "Resultat{" +
                "id=" + id +
                ", etudiant=" + (etudiant != null ? etudiant.getNom() : "Non spécifié") +
                ", cours=" + (cours != null ? cours.getNom() : "Non spécifié") +
                ", note=" + note +
                ", commentaire='" + commentaire + '\'' +
                '}';
    }
}
