<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Afficher les Notes</title>
</head>
<body>
    <h1>Liste des Notes</h1>
    <table border="1">
        <tr>
            <th>Étudiant</th>
            <th>Cours</th>
            <th>Note</th>
            <th>Commentaire</th>
        </tr>
        <c:forEach var="resultat" items="${resultats}">
            <tr>
                <td>${resultat.etudiant.email}</td>
                <td>${resultat.cours.nom}</td>
                <td>${resultat.note}</td>
                <td>${resultat.commentaire}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
