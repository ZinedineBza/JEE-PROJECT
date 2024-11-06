package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Utilisateur;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

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
        Session session = sessionFactory.openSession();
        Utilisateur utilisateur = session.get(Utilisateur.class, email);
        session.close();
        return utilisateur;
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
}