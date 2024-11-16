package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Resultat;
import jeeprojet.application.Modele.ResultatId;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class ResultatDAO {
    private SessionFactory sessionFactory;

    public ResultatDAO() {
        sessionFactory = new Configuration().configure().buildSessionFactory();
    }


    public void save(Resultat resultat) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(resultat);
        transaction.commit();
        session.close();
    }

    public Resultat get(ResultatId id) {
        Session session = sessionFactory.openSession();
        Resultat resultat = session.get(Resultat.class, id);
        session.close();
        return resultat ;
    }

    public List<Resultat> getAll() {
        List<Resultat> res = new ArrayList<>();
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Resultat> query = session.createQuery("FROM Resultat ", Resultat.class);
            res = query.getResultList();
            System.out.println(res);
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return res;
    }

    public void update(Resultat resultat) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(resultat);
        transaction.commit();
        session.close();
    }

    public void delete(Resultat resultat) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(resultat);
        transaction.commit();
        session.close();
    }
}

