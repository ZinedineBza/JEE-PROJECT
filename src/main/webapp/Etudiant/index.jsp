<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Étudiant</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
    <link href='https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.css' rel='stylesheet' />
    <script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.js'></script>
    <style>
        #calendar {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>
<%
    // Récupérer l'utilisateur de la session
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("user");
    String role = (utilisateur != null) ? utilisateur.getRole() : "";
%>
<!-- Barre de navigation en haut -->
<header>
    <nav>
        <a href="Etudiant/index.jsp">Accueil</a>
        <% if (!"enseignant".equals(role)) { %>
        <a href="<%= request.getContextPath() %>/ListInscriptionServlet">Inscriptions</a>
        <% } %>
        <a href="<%= request.getContextPath() %>/listResultats">Résultats</a>
    </nav>
</header>

<div class="main-content">
    <h1>Bienvenue sur votre Espace ${user.role}</h1>

    <section class="emploi-du-temps">
        <h2>Votre Emploi du Temps</h2>
        <div id='calendar'></div>
    </section>
</div>

<!-- Pied de page -->
<footer>
    <p>&copy; 2024 Université XYZ - Tous droits réservés</p>
</footer>

<script>
    $(document).ready(function() {
        var events = [
            <c:forEach var="course" items="${listCourses}">
            {
                title: "${course.nom.nom} \n ${course.enseignant.nom} ${course.enseignant.prenom} \n ${course.salle}",
                start: '${course.id.date}T${course.id.horaire}',  // Heure de début
                end: moment('${course.id.date}T${course.id.horaire}').add(2, 'hours').format('YYYY-MM-DDTHH:mm:ss'),  // Heure de fin (ajoute 2 heures)
                description: 'Enseignant: ${course.enseignant.nom}, Salle: ${course.salle}'  // Description de l'événement
            },
            </c:forEach>
        ];

        // Affichage dans la console pour vérifier uniquement le start
        <c:forEach var="course" items="${listCourses}">
        console.log("${course.id.date}");  // Affiche uniquement l'heure de début de chaque cours
        console.log("${course.id.horaire}");
        </c:forEach>



        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultView: 'agendaWeek',
            editable: false,
            events: events,
            minTime: "08:00:00",
            maxTime: "20:00:00",
            validRange: {
                start: '2024-01-01', // Date de début
                end: '2024-12-31'    // Date de fin
            },
            weekends: false, // Désactive les samedis et dimanches
            eventRender: function(event, element) {
                element.qtip({
                    content: event.description
                });
            }
        });
    });
</script>

</body>
</html>
