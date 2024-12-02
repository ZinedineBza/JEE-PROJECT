package com.example.javaee.repository;

import java.util.List;

import com.example.javaee.model.Classe;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClasseRepository extends JpaRepository<Classe, String> {
    // Tu peux ajouter des méthodes personnalisées ici si nécessaire
}
