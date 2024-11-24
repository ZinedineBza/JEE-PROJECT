package jeeprojet.application.Modele;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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

    public String toString() {
        return classe;
    }
}