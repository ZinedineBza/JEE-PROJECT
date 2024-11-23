package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CoursDAO {
    // Sauvegarde d'un cours
    public void save(Cour cours) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(cours);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Recherche d'un cours par ID
    public Cour findById(CourId id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Cour.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Mise à jour d'un cours
    public void update(Cour cours) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(cours);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    // Suppression d'un cours
    public void delete(Cour cours) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.delete(cours);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Cour> findAll() {
        List<Cour> cours = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // Utilisation de JOIN FETCH pour éviter LazyInitializationException
            Query<Cour> query = session.createQuery("FROM Cour c " +
                    "JOIN FETCH c.nom " + // Matiere
                    "JOIN FETCH c.enseignant", Cour.class); // Utilisateur (enseignant)
            cours = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return cours;
    }

    public List<Cour> findByUtilisateur(String utilisateurEmail) {
        List<Cour> cours = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // Utilisation de JOIN FETCH pour éviter LazyInitializationException
            Query<Cour> query = session.createQuery("FROM Cour c " +
                    "JOIN FETCH c.nom " + // Matiere
                    "JOIN FETCH c.enseignant " + // Utilisateur (enseignant)
                    "WHERE c.enseignant.email = :email OR c.nom IN (SELECT i.cours FROM Inscription i WHERE i.etudiant = :email)", Cour.class);

            // Passer l'email de l'utilisateur en paramètre pour enseignant ou étudiant
            query.setParameter("email", utilisateurEmail);

            cours = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return cours;
    }


}
