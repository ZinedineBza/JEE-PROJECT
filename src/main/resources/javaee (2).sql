-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 30 nov. 2024 à 21:39
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
('Anglais', 'kaddacheyo@cy-tech.fr', 'C103', '2024-11-26', '13:00:00');

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
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `idNotification` int(11) NOT NULL,
  `message` text NOT NULL,
  `dateEnvoi` date NOT NULL,
  `destinataire` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('Fmarti2', '$2a$10$N0OTy/7IEuX4ak.w9wOrsORGYwa4VEXhFveUuWVNh/rncX94sg6kO', 'enseignant', 'Martins soares', 'Flavio', '2002-03-08', 'kaddacheyo@cy-tech.fr', NULL),
('Fmarti1', '$2a$10$crFbIw7vvDkKdXPr4pUc0esqNvoHkAgxRy7xRiy9JKHmQj6ARSOrK', 'etudiant', 'Martins soares', 'Flavio', '2002-03-08', 'martinssoa@cy-tech.fr', 'ING1'),
('Fmarti', '$2a$10$uAn7YxCB4SYHnSdwsCsvb.lAw29OYfYI1U/N1sZPNGm8HhLu4WnXS', 'etudiant', 'Martins soares', 'Flavio', '2002-03-08', 'soares.flavio2002@gmail.com', 'ING1');

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
-- Déchargement des données de la table `vieux_utilisateurs`
--

INSERT INTO `vieux_utilisateurs` (`pseudo`, `motDePasse`, `role`, `nom`, `prenom`, `dateNaissance`, `email`, `classe`, `dateDesactivation`) VALUES
('aadmin1', '$2a$10$78fxWdfaSxDvH8hQI5TQq.HR2MbstAPfKOYjEmbKFWbLpex6m8fq.', 'etudiant', 'admin', 'admin', '1111-11-11', 'admin2@admin.com', 'ING1', '2024-11-30'),
('admin', 'admin', 'admin', 'admin', 'admin', '0000-00-00', 'admin@admin.admin', NULL, '2024-11-30'),
('aadmin', '$2a$10$CzQMmIKgKIv/kBUBLhmaxeM/D4zJoSiFtWlVbleB4E4vcRmPppeZi', 'etudiant', 'admin', 'admin', '1111-11-11', 'admin@admin.com', 'ING1', '2024-11-30'),
('admin', '$2a$10$KIXzTzZJeNmTj9ewz58Z.eFqWgXKmM7tQ.g2ynq.A0yG1X6nmnZWG', 'admin', 'Admin', 'User', NULL, 'admin@example.com', NULL, '2024-11-30'),
('Amhama', 'OOychw28Xp<_', 'enseignant', 'Mhamat Aware', 'Aware', '2001-10-17', 'awareaware37@gmail.com', NULL, '2024-11-30'),
('Zbenzo', 'AKPIQO9X9s/$', 'etudiant', 'Benzoua', 'Zinedine', '2002-11-28', 'benzouazin@cy-tech.fr', 'ING2', '2024-11-30'),
('Jekoka', 'oBPWvbgmSu/}', 'etudiant', 'Ekoka', 'Jeremy', '2003-11-16', 'eyombwaek@cy-tech.fr', 'ING1', '2024-11-30'),
('Ykadda', 'vF78qdbBOI*/', 'etudiant', 'Kaddache', 'Younes', '2004-06-02', 'kaddacheyo@cy-tech.fr', 'ING1', '2024-11-30'),
('Fmarti', '5hy1z3pyDT}{', 'etudiant', 'Martins soares', 'Flavio', '2002-03-08', 'soares.flavio2002@gmail.com', 'ING3', '2024-11-30'),
('Tforti', 'WB3IgWPByW^*', 'enseignant', 'Fortier', 'Theo', '2003-08-13', 'test@test.com', NULL, '2024-11-30');

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
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`idNotification`),
  ADD KEY `destinataire` (`destinataire`);

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
-- Index pour la table `vieux_utilisateurs`
--
ALTER TABLE `vieux_utilisateurs`
  ADD PRIMARY KEY (`email`,`dateDesactivation`),
  ADD KEY `classe` (`classe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `idNotification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`destinataire`) REFERENCES `utilisateur` (`email`);

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
