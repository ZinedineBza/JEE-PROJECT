package com.example.javaee.model;

import org.hibernate.Hibernate;

import jakarta.persistence.*;

import java.util.Objects;

import jakarta.persistence.Embeddable;

@Embeddable
public class CourId implements java.io.Serializable {
    private static final long serialVersionUID = -3751021465129577899L;

    @Column(name = "date", nullable = false)
    private String date;

    @Column(name = "horaire", nullable = false)
    private String horaire;

    @Column(name = "enseignant", nullable = false, length = 50)
    private String enseignant;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        CourId entity = (CourId) o;
        return Objects.equals(this.date, entity.date) &&
                Objects.equals(this.horaire, entity.horaire) &&
                Objects.equals(this.enseignant, entity.enseignant);
    }

    @Override
    public int hashCode() {
        return Objects.hash(date, horaire, enseignant);
    }


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

    @Override
    public String toString() {
        return "CourId{" +
                "date='" + date + '\'' +
                ", horaire='" + horaire + '\'' +
                ", enseignant='" + enseignant + '\'' +
                '}';
    }
}
