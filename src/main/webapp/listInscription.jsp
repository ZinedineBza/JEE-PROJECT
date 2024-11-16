<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des Inscriptions</title>
</head>
<body>
<h1>Liste des Inscriptions</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Etudiant</th>
        <th>Cours</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inscription" items="${inscriptions}">
        <tr>
            <td>${inscription.id}</td>
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
