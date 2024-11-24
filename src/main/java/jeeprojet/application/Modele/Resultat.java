package jeeprojet.application.Modele;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "resultat")
public class Resultat {
    @EmbeddedId
    private ResultatId id;

    @MapsId("etudiant")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant;

    @MapsId("matiere")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "matiere", referencedColumnName = "nom", nullable = false)
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
                "id=" + id +
                ", etudiant=" + (etudiant != null ? etudiant.getNom() : "Non spécifié") +
                ", cours=" + (cours != null ? cours.getNom() : "Non spécifié") +
                ", note=" + note +
                ", commentaire='" + commentaire + '\'' +
                '}';
    }
}
