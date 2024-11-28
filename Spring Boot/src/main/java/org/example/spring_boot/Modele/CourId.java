package org.example.spring_boot.Modele;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CourId implements Serializable {

    @Column(name = "date", nullable = false)
    private String date;

    @Column(name = "horaire", nullable = false)
    private String horaire;

    @Column(name = "enseignant", nullable = false)
    private String enseignant;

    // Getters et setters
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHoraire() {
        return horaire;
    }

    public void setHoraire(String horaire) {
        this.horaire = horaire;
    }

    public String getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(String enseignant) {
        this.enseignant = enseignant;
    }

    // Égalité et hashCode pour une clé composite
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CourId courId = (CourId) o;
        return Objects.equals(date, courId.date) &&
                Objects.equals(horaire, courId.horaire) &&
                Objects.equals(enseignant, courId.enseignant);
    }

    @Override
    public int hashCode() {
        return Objects.hash(date, horaire, enseignant);
    }
}
