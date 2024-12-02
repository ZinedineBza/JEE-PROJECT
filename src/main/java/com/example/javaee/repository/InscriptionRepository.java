package com.example.javaee.repository;

import com.example.javaee.model.Inscription;
import com.example.javaee.model.InscriptionId;
import com.example.javaee.model.Matiere;
import com.example.javaee.model.Utilisateur;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InscriptionRepository extends JpaRepository<Inscription, InscriptionId> {
    // Trouver les inscriptions par étudiant
    List<Inscription> findByIdEtudiant(String etudiant);

    // Trouver les inscriptions par matière
    List<Inscription> findByIdMatiere(String matiere);

    // Trouver toutes les inscriptions pour une date donnée
    List<Inscription> findByIdDateInscription(String dateInscription);

    // Trouver toutes les inscriptions pour une date donnée
    List<Inscription> findByIdDateInscriptionAndIdMatiere(String dateInscription, String matiere);

    //  Vérification de l'existence d'un utilisateur par email et rôle
    boolean existsByEtudiantAndMatiere(Utilisateur etudiant, Matiere matiere);

    @Query("SELECT i FROM Inscription i " +
            "WHERE i.matiere IN (" +
            "  SELECT c.matiere FROM Cour c WHERE c.enseignant = :enseignantEmail" +
            ")")
    List<Inscription> findByEnseignant(@Param("enseignantEmail") String enseignantEmail);

    // Trouver les inscriptions par étudiant
    List<Inscription> findByEtudiantEmail(String etudiantEmail);



}
