package jeeprojet.application.Modele.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Modele.InscriptionId;
import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.HibernateUtil;

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
    public boolean isAlreadyEnrolled(String etudiantEmail, String matiereNom) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Long count = session.createQuery(
                            "SELECT COUNT(i) FROM Inscription i WHERE i.id.etudiant = :etudiantEmail AND i.id.matiere = :matiereNom", Long.class)
                    .setParameter("etudiantEmail", etudiantEmail)
                    .setParameter("matiereNom", matiereNom)
                    .uniqueResult();
            return count > 0; // Retourne true si l'inscription existe
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
    public boolean deleteInscription(String etudiantEmail, String matiereNom) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Requête HQL pour supprimer une inscription spécifique
            int deletedCount = session.createQuery(
                            "DELETE FROM Inscription i WHERE i.id.etudiant = :etudiantEmail AND i.id.matiere = :matiereNom")
                    .setParameter("etudiantEmail", etudiantEmail)
                    .setParameter("matiereNom", matiereNom)
                    .executeUpdate();

            transaction.commit();
            return deletedCount > 0; // Retourne true si une inscription a été supprimée
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
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
    
    // Recherche les inscriptions d'un enseignant par son email
    public List<Inscription> findByEnseignant(String enseignantEmail) {
        List<Inscription> inscriptions = null;

        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT i FROM Inscription i " +
                         "JOIN i.matiere m " +
                         "JOIN m.cours c " +
                         "WHERE c.enseignant.email = :enseignantEmail";
            Query<Inscription> query = session.createQuery(hql, Inscription.class);
            query.setParameter("enseignantEmail", enseignantEmail);

            inscriptions = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return inscriptions;
    }

}


