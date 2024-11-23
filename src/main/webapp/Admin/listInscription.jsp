<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<%-- Récupération de l'utilisateur de la session --%>
<c:set var="user" value="${sessionScope.user}" />

<h1>Liste des Inscriptions</h1>
<table border="1">
    <thead>
    <tr>
        <th>Cours</th>
        <c:if test="${user.role == 'admin'}">
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Actions</th>
        </c:if>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="inscription" items="${inscriptions}">
        <c:choose>
            <c:when test="${user.role == 'admin'}">
                <tr>
                    <td>${inscription.cours.nom}</td>
                    <td>${inscription.etudiant.nom}</td>
                    <td>${inscription.etudiant.prenom}</td>
                    <td>${inscription.etudiant.email}</td>
                    <td>
                        <a href="InscriptionServlet?action=edit&id=${inscription.id}">Modifier</a> |
                        <a href="InscriptionServlet?action=delete&id=${inscription.id}" onclick="return confirm('Voulez-vous vraiment supprimer cette inscription ?');">Supprimer</a>
                    </td>
                </tr>
            </c:when>
            <c:when test="${user.role == 'etudiant' && user.email == inscription.etudiant.email}">
                <tr>
                    <td>${inscription.cours.nom}</td>
                </tr>
            </c:when>
        </c:choose>
    </c:forEach>
    </tbody>
</table>

<c:if test="${user.role == 'admin'}">
    <a href="addInscription.jsp">Ajouter une Inscription</a>
</c:if>
</body>
</html>
