package com.example.javaee.model;

import java.util.List;

public class ResultatParMatiere {
    private String matiere;
    private double moyenne;
    private List<Resultat> notes;

    public ResultatParMatiere(String matiere, double moyenne, List<Resultat> notes) {
        this.matiere = matiere;
        this.moyenne = moyenne;
        this.notes = notes;
    }

    // Getters et Setters
    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    public double getMoyenne() {
        return moyenne;
    }

    public void setMoyenne(double moyenne) {
        this.moyenne = moyenne;
    }

    public List<Resultat> getNotes() {
        return notes;
    }

    public void setNotes(List<Resultat> notes) {
        this.notes = notes;
    }
}
