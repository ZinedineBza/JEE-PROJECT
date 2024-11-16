package jeeprojet.application.Modele;

import javax.persistence.*;

@Entity
@Table(name = "resultat")
public class Resultat {
    @EmbeddedId
    private ResultatId id;

    @MapsId("etudiant")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant;

    @MapsId("cours")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "cours", nullable = false)
    private Matiere cours;

    @Column(name = "note")
    private Float note;

    @Lob
    @Column(name = "commentaire")
    private String commentaire;

    public ResultatId getId() {
        return id;
    }

    public void setId(ResultatId id) {
        this.id = id;
    }

    public Utilisateur getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Utilisateur etudiant) {
        this.etudiant = etudiant;
    }

    public Matiere getCours() {
        return cours;
    }

    public void setCours(Matiere cours) {
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
                "id=" + id +  // Affiche l'ID composite
                ", etudiant=" + (etudiant != null ? etudiant.getNom() : "Non spécifié") +  // Affiche le nom de l'étudiant
                ", cours=" + (cours != null ? cours.getNom() : "Non spécifié") +  // Affiche le nom du cours
                ", note=" + note +
                ", commentaire='" + commentaire + '\'' +
                '}';
    }

}