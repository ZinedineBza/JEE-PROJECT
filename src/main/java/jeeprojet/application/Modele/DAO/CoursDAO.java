package jeeprojet.application.Modele.DAO;
import jeeprojet.application.Modele.Cour;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jeeprojet.application.Modele.Cour;
import jeeprojet.application.Modele.CourId;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.List;

public class CoursDAO {

    private EntityManager entityManager;

    public CoursDAO() {
        this.entityManager = Persistence.createEntityManagerFactory("jeeprojet").createEntityManager();
    }

    public void save(Cour cours) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(cours);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public Cour findById(CourId id) {
        return entityManager.find(Cour.class, id);
    }

    public void update(Cour cours) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(cours);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public void delete(Cour cours) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.remove(cours);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Cour> findAll() {
        return entityManager.createQuery("SELECT c FROM Cour c", Cour.class).getResultList();
    }
}
