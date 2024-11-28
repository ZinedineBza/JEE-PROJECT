package org.example.spring_boot.Modele.DAO;
import org.example.spring_boot.Modele.Matiere;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MatiereRepository extends JpaRepository<Matiere, String> {

    // Rechercher une matière par nom
    Matiere findByNom(String nom);

    // Rechercher les matières enseignées par un enseignant donné
    @Query("SELECT DISTINCT c.matiere FROM Cour c WHERE c.enseignant.email = :email")
    List<Matiere> findMatiereByEnseignant(@Param("email") String emailEnseignant);
}
