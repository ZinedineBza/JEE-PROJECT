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

    public void supprimer(Utilisateur utilisateur) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        try {
            session.delete(utilisateur);
            System.out.println("supprimer de " + utilisateur.getNom());
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
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

    public Utilisateur findByPseudo(String pseudo) {
        Utilisateur user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE pseudo = :pseudo", Utilisateur.class);
            query.setParameter("pseudo", pseudo);
            user = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
        }
        return user;
    }

    public List<Utilisateur> findByRole(String role) {
        List<Utilisateur> users = new ArrayList<>();
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE role = :role", Utilisateur.class);
            query.setParameter("role", role);
            users = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public List<Utilisateur> findAllStudents() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE role = 'ETUDIANT'", Utilisateur.class);
            return query.list();
        }
    }

    public List<Utilisateur> findAllByRole(String role) {
        try (Session session = sessionFactory.openSession()) {
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE role = :role", Utilisateur.class);
            query.setParameter("role", role);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Récupérer la liste des étudiants inscrits aux matières enseignées par un enseignant
    public List<Utilisateur> findEtudiantsInscritsAuxMatieres(String enseignantEmail) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "SELECT DISTINCT u FROM Inscription i " +
                         "JOIN i.etudiant u " +
                         "JOIN i.matiere m " +
                         "WHERE m.nom IN (SELECT c.matiere.nom FROM Cour c WHERE c.enseignant.email = :email)";
            Query<Utilisateur> query = session.createQuery(hql, Utilisateur.class);
            query.setParameter("email", enseignantEmail);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Utilisateur> findElevesByClasseAndMatiere(String classe, String matiere) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();

            // Requête HQL avec jointure implicite entre Inscription, Utilisateur et Matiere
            String hql = "SELECT i.etudiant FROM Inscription i " +
                    "JOIN i.etudiant u " + // Rejoindre l'entité Utilisateur
                    "JOIN i.matiere m " +  // Rejoindre l'entité Matiere
                    "WHERE u.classe.classe = :classe " + // Accéder à la classe via l'utilisateur
                    "AND m.nom = :matiere"; // Accéder à la matière via l'inscription

            Query<Utilisateur> query = session.createQuery(hql, Utilisateur.class);
            query.setParameter("classe", classe);
            query.setParameter("matiere", matiere);

            // Affichage pour déboguer
            System.out.println("Classe: " + classe + " | Matière: " + matiere);

            List<Utilisateur> eleves = query.list();

            // Commit de la transaction
            tx.commit();

            return eleves;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }



}


