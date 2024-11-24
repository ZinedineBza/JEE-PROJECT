package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Matiere;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

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
        Session session = sessionFactory.openSession();
        List<Matiere> matieres = session.createQuery("from Matiere").list();
        session.close();
        return matieres;
    }
}
