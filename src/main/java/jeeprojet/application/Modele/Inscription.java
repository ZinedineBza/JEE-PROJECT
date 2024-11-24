package jeeprojet.application.Modele;

import javax.persistence.*;

@Entity
@Table(name = "inscription")
public class Inscription {
    @EmbeddedId
    private InscriptionId id;

    @MapsId("etudiant")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant;

    @MapsId("matiere")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "matiere", nullable = false)
    private Matiere matiere;

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

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    @Override
    public String toString() {
        return "Inscription{" +
                "id=" + id +
                ", etudiant=" + (etudiant != null ? etudiant.getNom() + " " + etudiant.getPrenom() : "null") +
                ", matiere=" + (matiere != null ? matiere.getNom() : "null") +
                '}';
    }


}