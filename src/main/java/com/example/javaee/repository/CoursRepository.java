package com.example.javaee.repository;
import com.example.javaee.model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CoursRepository extends JpaRepository<Cour, CourId> {

    // Trouver tous les cours pour un enseignant spécifique
    @Query("SELECT c FROM Cour c WHERE c.enseignant.id = :enseignantId")
    List<Cour> findAllByEnseignant(@Param("enseignantId") String enseignantId);

    // Trouver tous les cours pour une matière spécifique
    @Query("SELECT c FROM Cour c WHERE c.matiere.id = :matiereId")
    List<Cour> findAllByMatiere(@Param("matiereId") Long matiereId);

    // Trouver un cours par sa date et son horaire
    @Query("SELECT c FROM Cour c WHERE c.id.date = :date AND c.id.horaire = :horaire")
    List<Cour> findAllByDateAndHoraire(@Param("date") String date, @Param("horaire") String horaire);
}
