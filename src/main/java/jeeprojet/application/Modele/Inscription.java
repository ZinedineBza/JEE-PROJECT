package jeeprojet.application.Modele;

import javax.persistence.*;

@Entity
@Table(name = "inscription")
public class Inscription {
    @EmbeddedId
    private InscriptionId id;

    @MapsId("etudiant")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cours")
    private Matiere cours;

    public InscriptionId getId() {
        return id;
    }

    public void setId(InscriptionId id) {
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

}