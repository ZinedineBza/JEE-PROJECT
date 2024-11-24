package jeeprojet.application.Modele.DAO;

import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Util.HibernateUtil;

import java.util.List;

public class MatiereDAO {

    private SessionFactory sessionFactory;

    public MatiereDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    public Matiere findById(String id) {
        Session session = sessionFactory.openSession();
        Matiere matiere = session.get(Matiere.class, id);
        session.close();
        return matiere;
    }

    public List<Matiere> findAll() {
        try (Session session = sessionFactory.openSession()) {
            Query<Matiere> query = session.createQuery("FROM Matiere", Matiere.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Matiere findByName(String name) {
        try (Session session = sessionFactory.openSession()) {
            Query<Matiere> query = session.createQuery("FROM Matiere WHERE nom = :nom", Matiere.class);
            query.setParameter("nom", name);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Matiere> findMatiereByEnseignant(String emailEnseignant) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "SELECT c.matiere FROM Cour c WHERE c.enseignant.email = :email";
            Query<Matiere> query = session.createQuery(hql, Matiere.class);
            query.setParameter("email", emailEnseignant);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    
    

    
    

}
