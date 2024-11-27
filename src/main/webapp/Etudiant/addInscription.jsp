<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%
    // Récupérer l'utilisateur de la session
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
    String role = "";

    if (utilisateur == null) {
        response.sendRedirect( request.getContextPath() + "/redirectionServlet");
    } else {
        role = utilisateur.getRole();
    }
%>
<head>
    <title>Ajouter une Inscription</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>


<body>

<h1>Ajouter une Inscription</h1>

<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>

<form action="<%= request.getContextPath() %>/AddInscriptionServlet" method="post">

    <div class="form-group">
    <label for="etudiantEmail">Email de l'Étudiant :</label>
        <select name="etudiantEmail" id="etudiantEmail" required>
            <c:forEach var="user" items="${users}">
                <option value="${user.email}">${user.prenom} ${user.nom}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
    <label for="coursId">Matière :</label>
    <select name="coursId" id="coursId" required>
        <c:forEach var="cours" items="${coursList}">
            <option value="${cours.nom}">${cours.nom}</option>
        </c:forEach>
    </select>
    <br>
    </div>

    <div class="form-group">
    <button type="submit">Enregistrer</button>
    </div>
</form>

<h2><a href="${pageContext.request.contextPath}/Admin/Main.jsp">Retour</a></h2>
</body>
</html>
