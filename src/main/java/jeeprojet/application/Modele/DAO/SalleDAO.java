package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Matiere;
import jeeprojet.application.Modele.Salle;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class SalleDAO {

    private SessionFactory sessionFactory;

    public SalleDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }

    public List<Salle> findAll() {
        try (Session session = sessionFactory.openSession()) {
            Query<Salle> query = session.createQuery("FROM Salle", Salle.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
