<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Liste des Inscriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<%-- Récupération de l'utilisateur depuis la session --%>
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
    <%-- Parcourir la liste des inscriptions --%>
    <c:forEach var="inscription" items="${inscriptions}">
        <tr>
            <td>${inscription.matiere.nom}</td>
            <c:if test="${user.role == 'admin'}">
                <td>${inscription.etudiant.nom}</td>
                <td>${inscription.etudiant.prenom}</td>
                <td>${inscription.etudiant.email}</td>
                <td>
                    <a href="InscriptionServlet?action=edit&id=${inscription.id}">Modifier</a> |
                    <a href="DeleteInscriptionServlet?id=${inscription.id}"
                       onclick="return confirm('Voulez-vous vraiment supprimer cette inscription ?');">
                        Supprimer
                    </a>
                </td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%-- Bouton pour ajouter une inscription si l'utilisateur est admin --%>
<c:if test="${user.role == 'admin'}">
    <a href="addInscription.jsp">Ajouter une Inscription</a>
</c:if>
</body>
</html>
