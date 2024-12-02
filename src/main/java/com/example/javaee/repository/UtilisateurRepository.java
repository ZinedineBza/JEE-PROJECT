package com.example.javaee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.javaee.model.Matiere;
import com.example.javaee.model.Utilisateur;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, String> {

    // Vérification de l'existence d'un utilisateur
    boolean existsByEmail(String email);

    // Vérification de l'existence d'un pseudo
    boolean existsByPseudo(String pseudo);
    
    // Encodage du mot de passe avant de sauvegarder
    @Transactional
    default Utilisateur saveWithEncodedPassword(Utilisateur utilisateur, PasswordEncoder passwordEncoder) {
        utilisateur.setMotDePasse(passwordEncoder.encode(utilisateur.getMotDePasse()));
        return save(utilisateur);
    }

    // Recherche par pseudo
    @Query("SELECT u FROM Utilisateur u WHERE u.pseudo = ?1")
    Utilisateur findByPseudo(String pseudo);

    @Query("SELECT u FROM Utilisateur u WHERE CONCAT(u.prenom, ' ', u.nom) = ?1")
    Utilisateur findByFullName(String fullName);

    // Recherche par email
    Utilisateur findByEmail(String email);

    // Recherche par rôle
    List<Utilisateur> findByRole(String role);

    // Recherche des élèves d'une classe et matière en SQL natif
    @Query(value = "SELECT u.* FROM utilisateur u " +
                "JOIN inscription i ON u.email = i.etudiant_email " +
                "WHERE i.classe_id = :classeId AND i.matiere_id = :matiereId", 
        nativeQuery = true)
    List<Utilisateur> findElevesByClasseAndMatiereNative(@Param("classeId") String classeId, @Param("matiereId") String matiereId);

    // Vérification de l'existence d'un utilisateur par email et rôle
    boolean existsByEmailAndRole(String email, String role);


}
