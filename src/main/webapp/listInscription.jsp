<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Liste des Inscriptions</h1>
<table border="1">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Prenom</th>
        <th>email</th>
        <th>Cours</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inscription" items="${inscriptions}">
        <tr>
            <td>${inscription.etudiant.nom}</td>
            <td>${inscription.etudiant.prenom}</td>
            <td>${inscription.etudiant.email}</td>

            <td>${inscription.cours.nom}</td>
            <td>
                <a href="InscriptionServlet?action=edit&id=${inscription.id}">Modifier</a> |
                <a href="InscriptionServlet?action=delete&id=${inscription.id}" onclick="return confirm('Voulez-vous vraiment supprimer cette inscription ?');">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="addInscription.jsp">Ajouter une Inscription</a>
</body>
</html>