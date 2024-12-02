package com.example.javaee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.javaee.model.*;

import java.util.List;

@Repository
public interface ResultatRepository extends JpaRepository<Resultat, ResultatId> {

    // Trouver les résultats par email d'un étudiant
    List<Resultat> findByEtudiant_Email(String email);

    // Trouver les résultats par matière
    List<Resultat> findByCours_Nom(String nom);

    // Trouver les résultats pour un étudiant dans une matière spécifique
    List<Resultat> findByEtudiant_EmailAndCours_Nom(String email, String nom);

    // Trouver les résultats par une plage de notes
    List<Resultat> findByNoteBetween(Float minNote, Float maxNote);

    // Trouver les resultats d'un etudiant
    List<Resultat> findByEtudiant(Utilisateur etudiant);


}
