<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Utilisateurs et Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<header>
    <h1>Bienvenue dans l'application de gestion</h1>
</header>

<nav>
    <a href="createEtudiant.jsp">Créer un étudiant</a>
    <a href="createEnseignant.jsp">Créer un enseignant</a>
    <a href="<%= request.getContextPath() %>/listUsers">liste les etudiants</a>
    <a href="addInscription.jsp">Ajouter une inscription</a>
    <a href="<%= request.getContextPath() %>/ListInscriptionServlet">Lister les inscriptions</a>
    <a href="AddResultat.jsp">Ajouter un Resultat</a>
    <a href="<%= request.getContextPath() %>/listResultats">Lister les Resultats</a>
    <a href="createCourse.jsp">Ajouter un Cours</a>
    <a href="<%= request.getContextPath() %>/listCourses">Lister les cours</a>
</nav>

<h1>Gestion des utilisateurs et des inscriptions</h1>

<footer>
    &copy; 2024 Gestion Application - Tous droits réservés.
</footer>
</body>
</html>
