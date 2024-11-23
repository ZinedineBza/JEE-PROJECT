package jeeprojet.application.Modele;

import javax.persistence.*;
import java.sql.PseudoColumnUsage;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "utilisateur")
public class Utilisateur {
    @Column(name = "pseudo", nullable = false, length = 20)
    private String pseudo;
    @Id
    @Column(name = "email", nullable = false, length = 50)
    private String email;

    @Column(name = "motDePasse", nullable = false, length = 100)
    private String motDePasse;

    @Column(name = "role", nullable = false, length = 50)
    private String role;

    @Column(name = "nom", length = 50)
    private String nom;

    @Column(name = "prenom", length = 50)
    private String prenom;

    @Column(name = "dateNaissance")
    private String dateNaissance;

    @OneToMany(mappedBy = "enseignant")
    private Set<Cour> cours = new LinkedHashSet<>();

    @OneToMany(mappedBy = "etudiant")
    private Set<Inscription> inscriptions = new LinkedHashSet<>();

    @OneToMany(mappedBy = "destinataire")
    private Set<Notification> notifications = new LinkedHashSet<>();

    @OneToMany(mappedBy = "etudiant")
    private Set<Resultat> resultats = new LinkedHashSet<>();

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public Set<Cour> getCours() {
        return cours;
    }

    public void setCours(Set<Cour> cours) {
        this.cours = cours;
    }

    public Set<Inscription> getInscriptions() {
        return inscriptions;
    }

    public void setInscriptions(Set<Inscription> inscriptions) {
        this.inscriptions = inscriptions;
    }

    public Set<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(Set<Notification> notifications) {
        this.notifications = notifications;
    }

    public Set<Resultat> getResultats() {
        return resultats;
    }

    public void setResultats(Set<Resultat> resultats) {
        this.resultats = resultats;
    }

    @Override
    public String toString() {
        return "Utilisateur{" +
                ", motDePasse='" + motDePasse + '\'' +
                ", role='" + role + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", dateNaissance=" + dateNaissance +
                ", email='" + email + '\'' +
                '}';
    }

}