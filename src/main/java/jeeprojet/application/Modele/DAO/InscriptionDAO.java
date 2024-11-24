package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.*;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class InscriptionDAO {
    private SessionFactory sessionFactory;

    public InscriptionDAO() {
        sessionFactory = HibernateUtil.getSessionFactory(); // Utilisation cohérente du utilitaire
    }

    // Recherche un utilisateur par son email
    public Utilisateur findUtilisateurByEmail(String email) {
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            return session.createQuery("FROM Utilisateur WHERE email = :email", Utilisateur.class)
                    .setParameter("email", email)
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace(); // Il est préférable d'utiliser un logger ici
            return null;
        }
    }

    // Recherche un cours par son ID
    public Matiere findCoursById(String id) {
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            return session.get(Matiere.class, id);
        } catch (Exception e) {
            e.printStackTrace(); // Il est préférable d'utiliser un logger ici
            return null;
        }
    }

    // Sauvegarde une inscription
    public void save(Inscription inscription) {
        Session session = null;
        Transaction transaction = null;

        try {
            // Ouverture de la session
            session = sessionFactory.openSession();

            // Démarrage de la transaction
            transaction = session.beginTransaction();

            // Sauvegarde du cours
            session.save(inscription);

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

    // Trouve toutes les inscriptions
    public List<Inscription> findAll() {
        List<Inscription> inscriptions = new ArrayList<>();
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            Query<Inscription> query = session.createQuery("FROM Inscription", Inscription.class);
            inscriptions = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return inscriptions;
    }

    // Recherche une inscription par ID
    public Inscription findById(InscriptionId id) {
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            return session.get(Inscription.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Met à jour une inscription
    public void update(Inscription inscription) {
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            Transaction transaction = session.beginTransaction();
            session.update(inscription);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Supprime une inscription par ID
    public void delete(InscriptionId id) {
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            Transaction transaction = session.beginTransaction();
            Inscription inscription = session.get(Inscription.class, id); // On récupère d'abord l'entité à supprimer
            if (inscription != null) {
                session.delete(inscription);
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
    }

    // Recherche les inscriptions d'un utilisateur par son email
    public List<Inscription> findCoursUtilisateur(String email) {
        List<Inscription> inscriptions = new ArrayList<>();
        try (Session session = sessionFactory.openSession()) { // Utilisation de try-with-resources
            Query<Inscription> query = session.createQuery("FROM Inscription WHERE etudiant.email = :email", Inscription.class);
            query.setParameter("email", email);
            inscriptions = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return inscriptions;
    }

}