package jeeprojet.application.Modele;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.time.LocalDate;
import java.util.Objects;

@Embeddable
public class InscriptionId implements java.io.Serializable {
    private static final long serialVersionUID = -2222710418421490932L;

    @Column(name = "dateInscription", nullable = false)
    private String dateInscription;

    @Column(name = "etudiant", nullable = false, length = 50)
    private String etudiant;

    @Column(name = "matiere", nullable = false, length = 50)
    private String matiere;

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

    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        InscriptionId entity = (InscriptionId) o;
        return Objects.equals(this.dateInscription, entity.dateInscription) &&
                Objects.equals(this.etudiant, entity.etudiant) &&
                Objects.equals(this.matiere, entity.matiere);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dateInscription, etudiant, matiere);
    }

}