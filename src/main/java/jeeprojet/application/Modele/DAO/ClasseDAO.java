package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;


import java.util.List;

public class ClasseDAO {
    public Classe findById(String id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Classe.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Classe> findAll() {
        List<Classe> classes;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Classe> query = session.createQuery("FROM Classe", Classe.class);
            classes = query.list();
        }
        return classes;
    }

}
