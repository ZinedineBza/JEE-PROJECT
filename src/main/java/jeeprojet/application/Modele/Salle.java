package jeeprojet.application.Modele;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "salle")
public class Salle {
    @Id
    @Column(name = "salle", nullable = false, length = 20)
    private String salle;

    public String getSalle() {
        return salle;
    }

    public void setSalle(String salle) {
        this.salle = salle;
    }

    @Override
    public String toString() {
        return getSalle();
    }
}