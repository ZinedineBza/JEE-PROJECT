<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Relevé de Notes</title>
</head>
<body>
    <h1>Relevé de Notes</h1>
    <p>Nom : ${etudiant.nom}</p>
    <p>Prénom : ${etudiant.prenom}</p>
    <p>Email : ${etudiant.email}</p>

    <h2>Notes</h2>
    <table border="1">
        <tr>
            <th>Cours</th>
            <th>Note</th>
            <th>Commentaire</th>
        </tr>
        <c:forEach var="resultat" items="${releveDeNotes}">
            <tr>
                <td>${resultat.cours.nom}</td>
                <td>${resultat.note}</td>
                <td>${resultat.commentaire}</td>
            </tr>
        </c:forEach>
    </table>

    <h3>Moyenne : ${moyenne}</h3>
</body>
</html>
