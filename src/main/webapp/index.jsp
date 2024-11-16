<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Utilisateurs et Inscriptions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007BFF;
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav {
            margin: 20px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        nav a {
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #0056b3;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        footer {
            text-align: center;
            margin-top: 50px;
            padding: 20px;
            background-color: #007BFF;
            color: white;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <h1>Bienvenue dans l'application de gestion</h1>
</header>

<nav>
    <a href="createUser.jsp">Créer un étudiant</a>
    <a href="<%= request.getContextPath() %>/listUsers">list etudiant</a>
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
