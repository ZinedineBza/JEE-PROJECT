package jeeprojet.application.Modele;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.time.LocalDate;
import java.util.Objects;

@Embeddable
public class ResultatId implements java.io.Serializable {
    private static final long serialVersionUID = 2818281635601720783L;
    @Column(name = "etudiant", nullable = false, length = 50)
    private String etudiant;

    @Column(name = "cours", nullable = false, length = 50)
    private String cours;

    @Column(name = "date", nullable = false)
    private String date;

    public String getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(String etudiant) {
        this.etudiant = etudiant;
    }

    public String getCours() {
        return cours;
    }

    public void setCours(String cours) {
        this.cours = cours;
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
                Objects.equals(this.cours, entity.cours) &&
                Objects.equals(this.etudiant, entity.etudiant);
    }

    @Override
    public int hashCode() {
        return Objects.hash(date, cours, etudiant);
    }

}