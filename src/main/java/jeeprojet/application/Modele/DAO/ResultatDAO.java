package jeeprojet.application.Modele.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

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
}
