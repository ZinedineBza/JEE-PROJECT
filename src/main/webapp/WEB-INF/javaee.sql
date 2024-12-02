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


-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `dateInscription` date NOT NULL,
  `etudiant` varchar(50) NOT NULL,
  `matiere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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
('admin', '$2a$10$qRBF0qyypsSV7hgzeydioufdNBLXTLQHAYgDo/8qPDvOtPlsMiWYW', 'admin', 'admin', 'admin', '1111-11-11', 'admin3@admin.com', NULL);

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

