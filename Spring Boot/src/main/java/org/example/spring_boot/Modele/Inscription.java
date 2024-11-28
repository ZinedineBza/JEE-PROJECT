package jeeprojet.application.Modele;

import jakarta.persistence.*;
import org.example.spring_boot.Modele.InscriptionId;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Utilisateur;

@Entity
@Table(name = "inscription")
public class Inscription {

    @EmbeddedId
    private InscriptionId id; // Clé composite

    @MapsId("etudiant") // Associe la clé composite au champ etudiant
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "etudiant", nullable = false)
    private Utilisateur etudiant; // Relation avec Utilisateur

    @MapsId("matiere") // Associe la clé composite au champ matiere
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "matiere", nullable = false)
    private Matiere matiere; // Relation avec Matiere

    // Getters et setters
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
