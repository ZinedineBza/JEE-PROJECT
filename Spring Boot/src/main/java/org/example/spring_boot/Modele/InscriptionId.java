package org.example.spring_boot.Modele;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class InscriptionId implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "dateInscription", nullable = false)
    private String dateInscription;

    @Column(name = "etudiant", nullable = false, length = 50)
    private String etudiant;

    @Column(name = "matiere", nullable = false, length = 50)
    private String matiere;

    // Getters and setters
    public String getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(String dateInscription) {
        this.dateInscription = dateInscription;
    }

    public String getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(String etudiant) {
        this.etudiant = etudiant;
    }

    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    // Override equals and hashCode for Hibernate
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InscriptionId that = (InscriptionId) o;
        return Objects.equals(dateInscription, that.dateInscription) &&
                Objects.equals(etudiant, that.etudiant) &&
                Objects.equals(matiere, that.matiere);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dateInscription, etudiant, matiere);
    }

    // Override toString for better logging
    @Override
    public String toString() {
        return "InscriptionId{" +
                "dateInscription='" + dateInscription + '\'' +
                ", etudiant='" + etudiant + '\'' +
                ", matiere='" + matiere + '\'' +
                '}';
    }
}
