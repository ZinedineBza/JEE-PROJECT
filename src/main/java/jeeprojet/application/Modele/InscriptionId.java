package jeeprojet.application.Modele;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.time.LocalDate;
import java.util.Objects;

@Embeddable
public class InscriptionId implements java.io.Serializable {
    private static final long serialVersionUID = 5145270597091717023L;
    @Column(name = "dateInscription", nullable = false)
    private String dateInscription;

    @Column(name = "etudiant", nullable = false, length = 50)
    private String etudiant;

    public String getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(String dateInscription) {
        this.dateInscription = dateInscription;
    }

    public String getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(String etudiant) {
        this.etudiant = etudiant;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        InscriptionId entity = (InscriptionId) o;
        return Objects.equals(this.dateInscription, entity.dateInscription) &&
                Objects.equals(this.etudiant, entity.etudiant);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dateInscription, etudiant);
    }
    public String toString() {
        return "InscriptionId{" +
                "dateInscription='" + dateInscription + '\'' +
                ", etudiant='" + etudiant + '\'' +
                '}';
    }

}