package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.Inscription;
import jeeprojet.application.Util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class InscriptionDAO {

    public Utilisateur findUtilisateurByEmail(String email) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Utilisateur WHERE email = :email", Utilisateur.class)
                    .setParameter("email", email)
                    .uniqueResult();
        }
    }


    public Matiere findCoursById(String id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Matiere.class, id);
        }
    }


    public void save(Inscription inscription) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(inscription);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e; // Propager l'exception pour qu'elle soit gérée ailleurs
        }
    }


    public List<Inscription> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Inscription", Inscription.class).list();
        }
    }

    public Inscription findById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Inscription.class, id);
        }
    }

    public void update(Inscription inscription) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(inscription);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Inscription inscription = session.get(Inscription.class, id);
            if (inscription != null) {
                session.delete(inscription);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }


}
