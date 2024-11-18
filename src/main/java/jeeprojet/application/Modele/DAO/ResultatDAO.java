package jeeprojet.application.Modele.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.Utilisateur;

public class ResultatDAO {
    private Session session;

    public ResultatDAO(Session session) {
        this.session = session;
    }

    // Calcul de la moyenne d'un étudiant
    public Double calculerMoyenneParEtudiant(Utilisateur etudiant) {
        String hql = "SELECT AVG(r.note) FROM Resultat r WHERE r.etudiant = :etudiant";
        Query<Double> query = session.createQuery(hql, Double.class);
        query.setParameter("etudiant", etudiant);
        return query.uniqueResult();
    }

    // Génération du relevé de notes
    public List<Resultat> genererReleveDeNotes(Utilisateur etudiant) {
        String hql = "FROM Resultat r WHERE r.etudiant = :etudiant";
        Query<Resultat> query = session.createQuery(hql, Resultat.class);
        query.setParameter("etudiant", etudiant);
        return query.list();
    }

    // Obtenir toutes les notes
    public List<Resultat> obtenirToutesLesNotes() {
        String hql = "FROM Resultat";
        Query<Resultat> query = session.createQuery(hql, Resultat.class);
        return query.list();
    }

    // Calcul de la moyenne par cours
    public Double calculerMoyenneParCours(Matiere cours) {
    String hql = "SELECT AVG(r.note) FROM Resultat r WHERE r.cours = :cours";
    Query<Double> query = session.createQuery(hql, Double.class);
    query.setParameter("cours", cours);
    return query.uniqueResult();
}

// Obtenir les notes d'un étudiant
public List<Resultat> consulterResultatsParEtudiant(Utilisateur etudiant) {
    String hql = "FROM Resultat r WHERE r.etudiant = :etudiant";
    Query<Resultat> query = session.createQuery(hql, Resultat.class);
    query.setParameter("etudiant", etudiant);
    return query.list();
}

// Obtenir les notes d'un cours
/*
public List<Resultat> consulterResultatsParCours(Matiere cours) {
    String hql = "FROM Resultat r WHERE r.cours = :cours";
    Query<Resultat> query = session.createQuery(hql, Resultat.class);
    query.setParameter("cours", cours);
    return query.list();
}
*/
public List<Resultat> consulterResultatsParCours(String nomCours) {
    String hql = "FROM Resultat r WHERE r.cours.nom = :nomCours";
    Query<Resultat> query = session.createQuery(hql, Resultat.class);
    query.setParameter("nomCours", nomCours);
    return query.list();
}

}
