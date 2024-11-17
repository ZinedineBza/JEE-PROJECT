package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.*;
import jeeprojet.application.Util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class InscriptionDAO {
    private SessionFactory sessionFactory;

    public InscriptionDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

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
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(inscription);
        transaction.commit();
        session.close();
    }






    public List<Inscription> findAll() {
        List<Inscription> users = new ArrayList<>();
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Inscription> query = session.createQuery("FROM Inscription ", Inscription.class);
            users = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le dÃ©bogage
        }
        return users;
    }

    public Inscription findById(InscriptionId id) {
        Session session = sessionFactory.openSession();
        Inscription inscription = session.get(Inscription.class, id);
        session.close();
        return inscription;
    }

    public void update(Inscription inscription) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(inscription);
        transaction.commit();
        session.close();
    }

    public void delete(int id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(id);
        transaction.commit();
        session.close();
    }


}