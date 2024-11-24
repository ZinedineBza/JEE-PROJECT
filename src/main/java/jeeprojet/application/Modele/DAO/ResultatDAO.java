package jeeprojet.application.Modele.DAO;

import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.ResultatId;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.HibernateUtil;

public class ResultatDAO {
    private SessionFactory sessionFactory;

    public ResultatDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    // Enregistrer un résultat
    public void save(Resultat resultat) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(resultat);
            transaction.commit();
        }
    }

    // Récupérer un résultat par ID
    public Resultat get(ResultatId id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Resultat.class, id);
        }
    }

    // Récupérer tous les résultats
    public List<Resultat> getAll() {
        try (Session session = sessionFactory.openSession()) {
            Query<Resultat> query = session.createQuery("FROM Resultat", Resultat.class);
            return query.getResultList();
        }
    }

    // Mettre à jour un résultat
    public void update(Resultat resultat) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(resultat);
            transaction.commit();
        }
    }

    // Supprimer un résultat
    public void delete(Resultat resultat) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(resultat);
            transaction.commit();
        }
    }

    // Rechercher les résultats d'un utilisateur
    public List<Resultat> findByUser(Utilisateur user) {
        try (Session session = sessionFactory.openSession()) {
            Query<Resultat> query = session.createQuery("FROM Resultat WHERE etudiant = :user", Resultat.class);
            query.setParameter("user", user);
            return query.getResultList();
        }
    }

    // Rechercher les résultats d'une matière
    public List<Resultat> findByMatiere(Matiere matiere) {
        try (Session session = sessionFactory.openSession()) {
            Query<Resultat> query = session.createQuery("FROM Resultat WHERE cours = :matiere", Resultat.class);
            query.setParameter("matiere", matiere);
            return query.getResultList();
        }
    }

    // Calculer la moyenne des notes d'un étudiant
    public Double calculerMoyenneParEtudiant(Utilisateur etudiant) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT AVG(r.note) FROM Resultat r WHERE r.etudiant = :etudiant";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("etudiant", etudiant);
            return query.uniqueResult();
        }
    }

    // Générer le relevé de notes pour un étudiant
    public List<Resultat> genererReleveDeNotes(Utilisateur etudiant) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Resultat r WHERE r.etudiant = :etudiant";
            Query<Resultat> query = session.createQuery(hql, Resultat.class);
            query.setParameter("etudiant", etudiant);
            return query.list();
        }
    }

    // Calculer la moyenne des notes pour un cours
    public Double calculerMoyenneParCours(Matiere cours) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT AVG(r.note) FROM Resultat r WHERE r.cours = :cours";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("cours", cours);
            return query.uniqueResult();
        }
    }

    // Rechercher les résultats par étudiant
    public List<Resultat> consulterResultatsParEtudiant(Utilisateur etudiant) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Resultat r WHERE r.etudiant = :etudiant";
            Query<Resultat> query = session.createQuery(hql, Resultat.class);
            query.setParameter("etudiant", etudiant);
            return query.list();
        }
    }

    // Rechercher les résultats par nom du cours
    public List<Resultat> consulterResultatsParCours(Matiere cours) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Resultat r WHERE r.cours.nom = :nomCours";
            Query<Resultat> query = session.createQuery(hql, Resultat.class);
            query.setParameter("nomCours", cours);
            return query.list();
        }
    }

    // Obtenir toutes les notes
    public List<Resultat> obtenirToutesLesNotes() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Resultat";
            Query<Resultat> query = session.createQuery(hql, Resultat.class);
            return query.list();
        }
    }

    public Double calculerMoyenneParEtudiantEtCours(Utilisateur etudiant, Matiere cours) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT AVG(r.note) FROM Resultat r WHERE r.cours = :cours AND r.etudiant = :etudiant";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("cours", cours);
            query.setParameter("etudiant", etudiant);
            return query.uniqueResult();
        }
    }
    

    // Récupérer les résultats donnés par un enseignant
    public List<Resultat> findResultatByEnseignant(String enseignantEmail) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "SELECT r FROM Resultat r " +
            "JOIN r.etudiant e " +
            "JOIN r.cours m " +  // Remplacez r.matiere par r.cours
            "WHERE m.nom IN ( " +
            "    SELECT c.matiere.nom " +
            "    FROM Cour c " +
            "    WHERE c.enseignant.email = :email )";

            Query<Resultat> query = session.createQuery(hql, Resultat.class);
            query.setParameter("email", enseignantEmail);
                    // Debug : Affichez les résultats trouvés
        List<Resultat> resultats = query.getResultList();

        // Debug : Affichez les résultats trouvés
        System.out.println("Nombre de résultats natifs trouvés : " + resultats.size());
        for (Resultat resultat : resultats) {
            System.out.println("Résultat natif : " + resultat.getEtudiant().getNom() + " - " +
                               resultat.getCours().getNom() + " - " +
                               resultat.getNote());
        }

        return resultats;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }        
    
    
    
}
