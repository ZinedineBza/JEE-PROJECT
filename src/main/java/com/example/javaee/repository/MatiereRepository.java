package com.example.javaee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.javaee.model.Matiere;

@Repository
public interface MatiereRepository extends JpaRepository<Matiere, String> {

    // Trouver les matières dont le nom contient une chaîne spécifique
    List<Matiere> findByNomContaining(String partNom);
    
    // Trouver les matières dont le nom contient une chaîne spécifique
    List<Matiere> findByInscriptionsEtudiantEmail(String email);

    // Trouver une matière par son nom exact
    List<Matiere> findByNom(String nom);



}
