package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class CoursDAO {
    // Sauvegarde d'un cours
    private SessionFactory sessionFactory;

    public CoursDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }
    // Sauvegarde d'un cours
    public void save(Cour cours) {
        Session session = null;
        Transaction transaction = null;

        try {
            // Ouverture de la session
            session = sessionFactory.openSession();

            // Démarrage de la transaction
            transaction = session.beginTransaction();

            // Sauvegarde du cours
            session.save(cours);

            // Commit de la transaction
            transaction.commit();
        } catch (Exception e) {
            // En cas d'erreur, rollback de la transaction
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace(); // Afficher l'exception pour débogage
        } finally {
            // Fermeture de la session dans le bloc finally pour garantir la fermeture
            if (session != null && session.isOpen()) {
                session.close();
            }
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
                    "JOIN FETCH c.matiere " + // Matiere
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
                    "JOIN FETCH c.matiere " + // Matiere
                    "JOIN FETCH c.enseignant " + // Utilisateur (enseignant)
                    "WHERE c.enseignant.email = :email OR c.matiere IN (SELECT i.matiere FROM Inscription i WHERE i.etudiant = :email)", Cour.class);

            // Passer l'email de l'utilisateur en paramètre pour enseignant ou étudiant
            query.setParameter("email", utilisateurEmail);

            cours = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return cours;
    }


}
