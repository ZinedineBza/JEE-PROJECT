package com.example.javaee.repository;

import com.example.javaee.model.Inscription;
import com.example.javaee.model.InscriptionId;
import org.springframework.data.jpa.repository.JpaRepository;
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
}
