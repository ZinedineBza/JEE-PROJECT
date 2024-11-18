<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Étudiant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>


    <!-- Barre de navigation en haut -->
    <header>
        <nav>
            <a href="index.jsp">Accueil</a>
            <a href=<%= request.getContextPath() %>/ListInscriptionServlet>Inscriptions Cours</a>
            <a href=<%= request.getContextPath() %>/listResultats>Résultats</a>
        </nav>
    </header>

    <h1>Calendrier des Cours</h1>

    <table class="calendar">
        <thead>
        <tr>
            <th>Horaire</th>
            <th>Lundi</th>
            <th>Mardi</th>
            <th>Mercredi</th>
            <th>Jeudi</th>
            <th>Vendredi</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hour" items="${hours}">
            <tr>
                <td>${hour}</td> <!-- Affichage des horaires -->
                <c:forEach var="day" items="${days}">
                    <td>
                        <c:forEach var="course" items="${courses}">
                            <c:if test="${course.date == day && course.horaire == hour}">
                                <div>${course.nom} - ${course.enseignant} - ${course.salle}</div>
                            </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pied de page -->
    <footer>
        <p>&copy; 2024 Université XYZ - Tous droits réservés</p>
    </footer>


</body>
</html>
