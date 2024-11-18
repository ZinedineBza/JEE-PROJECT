<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Résultats par Étudiant</title>
</head>
<body>
    <h1>Résultats de : ${etudiant.nom} ${etudiant.prenom}</h1>
    <p>Email : ${etudiant.email}</p>

    <table border="1">
        <tr>
            <th>Cours</th>
            <th>Note</th>
            <th>Commentaire</th>
        </tr>
        <c:forEach var="resultat" items="${resultats}">
            <tr>
                <td>${resultat.cours.nom}</td>
                <td>${resultat.note}</td>
                <td>${resultat.commentaire}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
