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


