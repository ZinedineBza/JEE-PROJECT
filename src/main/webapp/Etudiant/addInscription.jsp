<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ajouter une Inscription</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>


<body>

<header>
    <nav>
        <a href="index.jsp">Accueil</a>
        <a href="<%= request.getContextPath() %>/ListInscriptionServlet">Inscriptions Cours</a>
        <a href="<%= request.getContextPath() %>/listResultats">Résultats</a>
    </nav>
</header>

<h1>Ajouter une Inscription</h1>

<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>

<form action="<%= request.getContextPath() %>/AddInscriptionServlet" method="post">
    <label for="etudiantEmail">Email de l'Étudiant :</label>
    <input type="email" name="etudiantEmail" id="etudiantEmail" required><br>

    <label for="coursId">Matière :</label>
    <select name="coursId" id="coursId" required>
        <c:forEach var="cours" items="${coursList}">
            <option value="${cours.nom}">${cours.nom}</option>
        </c:forEach>
    </select>
    <br>

    <button type="submit">Enregistrer</button>
</form>
</body>
</html>
