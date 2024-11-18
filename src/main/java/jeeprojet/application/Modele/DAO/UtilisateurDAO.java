package jeeprojet.application.Modele.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.HibernateUtil;

public class UtilisateurDAO {
    private SessionFactory sessionFactory;

    public UtilisateurDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    public void save(Utilisateur utilisateur) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(utilisateur);
        transaction.commit();
        session.close();
    }

    public void update(Utilisateur utilisateur) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(utilisateur);
        transaction.commit();
        session.close();
    }

    public void delete(Utilisateur utilisateur) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(utilisateur);
        transaction.commit();
        session.close();
    }

    public Utilisateur findById(String email) {
        Utilisateur user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE email = :email", Utilisateur.class);
            query.setParameter("email", email);
            user = query.uniqueResult();
            System.out.println(user);
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return user;
    }


    public List<Utilisateur> findAll() {
        List<Utilisateur> users = new ArrayList<>();
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur", Utilisateur.class);
            users = query.getResultList();
            System.out.println(users);
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return users;
    }

    public boolean emailExists(String email) {
        boolean exists = false;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(u) FROM Utilisateur u WHERE u.email = :email", Long.class);
            query.setParameter("email", email);
            Long count = query.uniqueResult();
            if (count != null && count > 0) {
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return exists;
    }
    public boolean pseudoExists(String pseudo) {
        boolean exists = false;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(u) FROM Utilisateur u WHERE u.pseudo = :pseudo", Long.class);
            query.setParameter("pseudo", pseudo);
            Long count = query.uniqueResult();
            if (count != null && count > 0) {
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return exists;
    }

    public List<Utilisateur> findAllStudents() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE role = 'ETUDIANT'", Utilisateur.class);
            return query.list();
        }
    }
    
    public List<Utilisateur> findByRole(String role) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE role = :role", Utilisateur.class);
            query.setParameter("role", role);
            return query.list();
        }
    }
    

}