package jeeprojet.application.Modele;

import javax.persistence.*;

@Entity
@Table(name = "resultat")
public class Resultat {
    @EmbeddedId
    private ResultatId id;

    @MapsId("etudiant")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant;

    @MapsId("cours")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
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

}