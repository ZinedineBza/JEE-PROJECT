package jeeprojet.application.Modele.DAO;

import jeeprojet.application.Modele.Classe;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;
import jeeprojet.application.Util.HibernateUtil;
import org.hibernate.Session;

import java.io.Serializable;

public class ClasseDAO {
    public Classe findById(String id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Classe.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
