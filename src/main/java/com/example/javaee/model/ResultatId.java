package com.example.javaee.model;

import org.hibernate.Hibernate;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.Objects;

@Embeddable
public class ResultatId implements java.io.Serializable {
    private static final long serialVersionUID = 2818281635601720783L;

    @Column(name = "etudiant", nullable = false)
    private String etudiant;
    
    @Column(name = "matiere", nullable = false)
    private String matiere;    

    @Column(name = "date", nullable = false)
    private String date;

    public String getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(String etudiant) {
        this.etudiant = etudiant;
    }

    public String getCours() {
        return matiere;
    }

    public void setCours(String cours) {
        this.matiere = cours;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        ResultatId entity = (ResultatId) o;
        return Objects.equals(this.date, entity.date) &&
                Objects.equals(this.matiere, entity.matiere) &&
                Objects.equals(this.etudiant, entity.etudiant);
    }

    @Override
    public int hashCode() {
        return Objects.hash(date, matiere, etudiant);
    }

    @Override
    public String toString() {
        return "ResultatId{" +
                "etudiant='" + etudiant + '\'' +
                ", matiere='" + matiere + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}