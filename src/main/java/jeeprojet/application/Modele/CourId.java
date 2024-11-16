package jeeprojet.application.Modele;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

@Embeddable
public class CourId implements java.io.Serializable {
    private static final long serialVersionUID = -3751021465129577899L;
    @Column(name = "date", nullable = false)
    private LocalDate date;

    @Column(name = "horaire", nullable = false)
    private LocalTime horaire;

    @Column(name = "enseignant", nullable = false, length = 50)
    private String enseignant;

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHoraire() {
        return horaire;
    }

    public void setHoraire(LocalTime horaire) {
        this.horaire = horaire;
    }

    public String getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(String enseignant) {
        this.enseignant = enseignant;
    }

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

}