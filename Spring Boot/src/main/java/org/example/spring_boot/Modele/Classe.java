package org.example.spring_boot.Modele;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "classe")
public class Classe {

    @Id
    @Column(name = "classe", nullable = false, length = 10)
    private String classe;

    public String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }

    @Override
    public String toString() {
        return classe;
    }

    public String orElse(Object o) {
        return "";
    }
}
