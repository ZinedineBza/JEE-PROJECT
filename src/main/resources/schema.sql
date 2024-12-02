
    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        date_inscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (date_inscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        date_envoi date not null,
        id_notification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (id_notification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        mot_de_passe varchar(100) not null,
        date_naissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);

    create table classe (
        classe varchar(10) not null,
        primary key (classe)
    ) engine=InnoDB;

    create table cours (
        salle varchar(5),
        matiere varchar(20) not null,
        date varchar(255) not null,
        enseignant varchar(255) not null,
        horaire varchar(255) not null,
        primary key (date, enseignant, horaire)
    ) engine=InnoDB;

    create table inscription (
        dateInscription varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        primary key (dateInscription, etudiant, matiere)
    ) engine=InnoDB;

    create table matiere (
        nom varchar(20) not null,
        primary key (nom)
    ) engine=InnoDB;

    create table notification (
        dateEnvoi date not null,
        idNotification integer not null auto_increment,
        destinataire varchar(50),
        message tinytext not null,
        primary key (idNotification)
    ) engine=InnoDB;

    create table resultat (
        note float(23),
        date varchar(255) not null,
        etudiant varchar(255) not null,
        matiere varchar(255) not null,
        commentaire tinytext,
        primary key (date, etudiant, matiere)
    ) engine=InnoDB;

    create table utilisateur (
        classe varchar(10),
        pseudo varchar(20) not null,
        email varchar(50) not null,
        nom varchar(50),
        prenom varchar(50),
        role varchar(50) not null,
        motDePasse varchar(100) not null,
        dateNaissance varchar(255),
        primary key (email)
    ) engine=InnoDB;

    alter table cours 
       add constraint FK28gfvoxcopj9ja792y41g7j51 
       foreign key (enseignant) 
       references utilisateur (email);

    alter table cours 
       add constraint FKte7m4hqntbf6d4467fvnv0bt3 
       foreign key (matiere) 
       references matiere (nom);

    alter table inscription 
       add constraint FK72tavwaovkwdm8biy93w0clrs 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table inscription 
       add constraint FKo090jb7v91qiu4hogs7m2duwf 
       foreign key (matiere) 
       references matiere (nom);

    alter table notification 
       add constraint FKrdilptxnvu6rh8j2t05f20xy1 
       foreign key (destinataire) 
       references utilisateur (email);

    alter table resultat 
       add constraint FKgnekut1dl2gd911nm4s2s8oru 
       foreign key (matiere) 
       references matiere (nom);

    alter table resultat 
       add constraint FKadpwf1jro9h5mmu7brke6r7f1 
       foreign key (etudiant) 
       references utilisateur (email);

    alter table utilisateur 
       add constraint FK9goonys6bmu8wnxcqiaipafni 
       foreign key (classe) 
       references classe (classe);
