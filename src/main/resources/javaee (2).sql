-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 déc. 2024 à 18:16
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `javaee`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`classe`) VALUES
('ING1'),
('ING2'),
('ING3');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `matiere` varchar(100) NOT NULL,
  `enseignant` varchar(50) NOT NULL,
  `salle` varchar(5) DEFAULT NULL,
  `date` date NOT NULL,
  `horaire` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`matiere`, `enseignant`, `salle`, `date`, `horaire`) VALUES
('Anglais', 'martinssoa@cy-tech.fr', 'C103', '2024-12-03', '08:00:00'),
('Anglais', 'martinssoa@cy-tech.fr', 'C103', '2024-12-03', '19:00:00');

--
-- Déclencheurs `cours`
--
DELIMITER $$
CREATE TRIGGER `before_insert_cours` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
    DECLARE role_enseignant VARCHAR(50);

    -- Récupérer le rôle de l'utilisateur
    SELECT role INTO role_enseignant
    FROM Utilisateur
    WHERE email = NEW.enseignant;

    -- Vérifier si le rôle est 'enseignant'
    IF role_enseignant != 'enseignant' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Le rôle doit être enseignant';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_room_availability` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
    DECLARE room_conflict_count INT;

    SELECT COUNT(*)
    INTO room_conflict_count
    FROM cours
    WHERE salle = NEW.salle
    AND date = NEW.date
    AND horaire = NEW.horaire;

    IF room_conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La salle est déjà occupée à cette heure-là.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_teacher_availability` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
    DECLARE teacher_conflict_count INT;

    SELECT COUNT(*)
    INTO teacher_conflict_count
    FROM cours
    WHERE enseignant = NEW.enseignant
    AND date = NEW.date
    AND horaire = NEW.horaire;

    IF teacher_conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L''enseignant a déjà un cours à cette heure-là.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `dateInscription` date NOT NULL,
  `etudiant` varchar(50) NOT NULL,
  `matiere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déclencheurs `inscription`
--
DELIMITER $$
CREATE TRIGGER `before_insert_inscription` BEFORE INSERT ON `inscription` FOR EACH ROW BEGIN
    DECLARE role_etudiant VARCHAR(50);

    -- Récupérer le rôle de l'utilisateur
    SELECT role INTO role_etudiant
    FROM Utilisateur
    WHERE email = NEW.etudiant;

    -- Vérifier si le rôle est 'etudiant'
    IF role_etudiant != 'etudiant' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Le rôle doit être etudiant';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`nom`) VALUES
('Anglais'),
('Chimie'),
('Informatique'),
('Mathématiques'),
('Physique');

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

CREATE TABLE `resultat` (
  `date` date NOT NULL,
  `note` float DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `etudiant` varchar(50) NOT NULL,
  `matiere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déclencheurs `resultat`
--
DELIMITER $$
CREATE TRIGGER `before_insert_resultat` BEFORE INSERT ON `resultat` FOR EACH ROW BEGIN
    DECLARE role_etudiant VARCHAR(50);

    -- Récupérer le rôle de l'utilisateur
    SELECT role INTO role_etudiant
    FROM Utilisateur
    WHERE email = NEW.etudiant;

    -- Vérifier si le rôle est 'etudiant'
    IF role_etudiant != 'etudiant' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Le rôle doit être etudiant';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `salle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`salle`) VALUES
('A101'),
('A102'),
('A103'),
('B101'),
('B102'),
('B103'),
('C101'),
('C102'),
('C103');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `pseudo` varchar(50) NOT NULL,
  `motDePasse` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `classe` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`pseudo`, `motDePasse`, `role`, `nom`, `prenom`, `dateNaissance`, `email`, `classe`) VALUES
('admin', '$2a$10$qRBF0qyypsSV7hgzeydioufdNBLXTLQHAYgDo/8qPDvOtPlsMiWYW', 'admin', 'admin', 'admin', '1111-11-11', 'admin3@admin.com', NULL),
('Fmarti', '$2a$10$qbJlurdTNiNvNpC2cI5ACuOPaW4gc5ffgozFitJyeuYVHLul1eRVu', 'enseignant', 'Martins soares', 'Flavio', '0011-01-08', 'martinssoa@cy-tech.fr', NULL),
('e1', '$2a$10$ll1.xuEUTHRQWICC4jRWquBadKJqL.CtpHUnzIRFg9A5VKngBmizS', 'etudiant', '1', 'etudiant1', '2010-10-10', 'test1@test.com', 'ING1');

--
-- Déclencheurs `utilisateur`
--
DELIMITER $$
CREATE TRIGGER `before_delete_utilisateur` BEFORE DELETE ON `utilisateur` FOR EACH ROW BEGIN
    -- Déplacer les données dans Vieux_utilisateurs
    INSERT INTO Vieux_utilisateurs (pseudo, motDePasse, role, nom, prenom, dateNaissance, email, classe, dateDesactivation)
    VALUES (OLD.pseudo, OLD.motDePasse, OLD.role, OLD.nom, OLD.prenom, OLD.dateNaissance, OLD.email, OLD.classe, CURDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `vieux_resultats`
--

CREATE TABLE `vieux_resultats` (
  `date` date NOT NULL,
  `note` int(11) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `etudiant` varchar(255) NOT NULL,
  `matiere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vieux_utilisateurs`
--

CREATE TABLE `vieux_utilisateurs` (
  `pseudo` varchar(50) NOT NULL,
  `motDePasse` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `classe` varchar(10) DEFAULT NULL,
  `dateDesactivation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`classe`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`date`,`horaire`,`enseignant`),
  ADD KEY `enseignant` (`enseignant`),
  ADD KEY `matiere` (`matiere`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`dateInscription`,`etudiant`,`matiere`),
  ADD KEY `etudiant` (`etudiant`),
  ADD KEY `matiere` (`matiere`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`nom`);

--
-- Index pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD PRIMARY KEY (`etudiant`,`matiere`,`date`),
  ADD KEY `matiere` (`matiere`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`salle`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`email`),
  ADD KEY `classe` (`classe`);

--
-- Index pour la table `vieux_resultats`
--
ALTER TABLE `vieux_resultats`
  ADD PRIMARY KEY (`date`,`etudiant`,`matiere`);

--
-- Index pour la table `vieux_utilisateurs`
--
ALTER TABLE `vieux_utilisateurs`
  ADD PRIMARY KEY (`email`,`dateDesactivation`),
  ADD KEY `classe` (`classe`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`enseignant`) REFERENCES `utilisateur` (`email`),
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`nom`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`etudiant`) REFERENCES `utilisateur` (`email`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`nom`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `resultat_ibfk_1` FOREIGN KEY (`etudiant`) REFERENCES `utilisateur` (`email`),
  ADD CONSTRAINT `resultat_ibfk_2` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`nom`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `classe` (`classe`);

--
-- Contraintes pour la table `vieux_utilisateurs`
--
ALTER TABLE `vieux_utilisateurs`
  ADD CONSTRAINT `vieux_utilisateurs_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `classe` (`classe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
