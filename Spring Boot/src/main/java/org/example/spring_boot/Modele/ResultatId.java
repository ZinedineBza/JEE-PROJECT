package org.example.spring_boot.Modele;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ResultatId implements Serializable {
    private static final long serialVersionUID = 1L;

    @Column(name = "etudiant", nullable = false, length = 50)
    private String etudiant;

    @Column(name = "matiere", nullable = false, length = 50)
    private String matiere;

    @Column(name = "date", nullable = false)
    private String date;

    // Getters and Setters
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }



    // Override equals and hashCode for Hibernate
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ResultatId that = (ResultatId) o;
        return Objects.equals(etudiant, that.etudiant) &&
                Objects.equals(matiere, that.matiere) &&
                Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(etudiant, matiere, date);
    }

    // Override toString for better logging
    @Override
    public String toString() {
        return "ResultatId{" +
                "etudiant='" + etudiant + '\'' +
                ", matiere='" + matiere + '\'' +
                ", date='" + date + '\'' +
                '}';
    }


}
