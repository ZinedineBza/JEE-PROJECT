package org.example.spring_boot.Modele.DAO;
import jeeprojet.application.Modele.Inscription;
import org.example.spring_boot.Modele.InscriptionId;
import org.example.spring_boot.Modele.Matiere;
import org.example.spring_boot.Modele.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface InscriptionRepository extends JpaRepository<Inscription, InscriptionId> {

    // Vérifie si un étudiant est déjà inscrit à une matière
    @Query("SELECT COUNT(i) > 0 FROM Inscription i WHERE i.id.etudiant = :etudiantEmail AND i.id.matiere = :matiereNom")
    boolean existsByEtudiantAndMatiere(@Param("etudiantEmail") String etudiantEmail, @Param("matiereNom") String matiereNom);

    // Trouve toutes les inscriptions d'un utilisateur
    @Query("FROM Inscription i WHERE i.etudiant.email = :email")
    List<Inscription> findByEtudiantEmail(@Param("email") String email);

    // Trouve toutes les inscriptions associées à un enseignant
    @Query("SELECT i FROM Inscription i " +
            "JOIN i.matiere m " +
            "JOIN m.cours c " +
            "WHERE c.enseignant.email = :enseignantEmail")
    List<Inscription> findByEnseignantEmail(@Param("enseignantEmail") String enseignantEmail);

    Utilisateur findUtilisateurByEmail(String etudiantEmail);

    Matiere findCoursById(String coursId);

    void update(Optional<Inscription> inscription);

    boolean deleteInscription(String etudiantEmail, String matiereNom);

    boolean isAlreadyEnrolled(String etudiantEmail, String nom);
}
