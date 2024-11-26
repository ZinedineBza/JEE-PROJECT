package jeeprojet.application.Modele;

import javax.persistence.*;

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
}
