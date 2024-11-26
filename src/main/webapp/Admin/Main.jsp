<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Utilisateurs et Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<header>
    <h1>Bienvenue dans l'application de gestion</h1>
</header>

<nav>
    <a href="${pageContext.request.contextPath}/FormUser?type=etudiant">Créer un étudiant</a>
    <a href="${pageContext.request.contextPath}/FormUser?type=enseignant">Créer un enseignant</a>
    <a href="<%= request.getContextPath() %>/listUsers?recherche=etudiant">liste les etudiants</a>
    <a href="<%= request.getContextPath() %>/listUsers?recherche=enseignant">liste les enseignants</a>
    <a href="${pageContext.request.contextPath}/Etudiant/addInscription.jsp">Ajouter une inscription</a>
    <a href="<%= request.getContextPath() %>/ListInscriptionServlet">Lister les inscriptions</a>
    <a href="${pageContext.request.contextPath}/addResultatEnseignant">Ajouter un Resultat</a>
    <a href="<%= request.getContextPath() %>/listResultats">Lister les Resultats</a>
    <a href="${pageContext.request.contextPath}/Admin/createCourse.jsp">Ajouter un Cours</a>
    <a href="<%= request.getContextPath() %>/GetMatiere">Liste Cours</a>
</nav>

<h1>Gestion des utilisateurs et des inscriptions</h1>

<footer>
    &copy; 2024 Gestion Application - Tous droits réservés.
</footer>
</body>
</html>
