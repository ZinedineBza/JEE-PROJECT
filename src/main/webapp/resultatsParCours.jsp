<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Résultats par Cours</title>
</head>
<body>
    <h1>Résultats pour le cours : ${cours.nom}</h1>

    <table border="1">
        <tr>
            <th>Étudiant</th>
            <th>Note</th>
            <th>Commentaire</th>
        </tr>
        <c:forEach var="resultat" items="${resultats}">
            <tr>
                <td>${resultat.etudiant.email}</td>
                <td>${resultat.note}</td>
                <td>${resultat.commentaire}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
