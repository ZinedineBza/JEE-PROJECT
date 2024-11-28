<%@ page import="jeeprojet.application.Modele.Utilisateur" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
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
<nav>
    <a href="<%= request.getContextPath() %>/logout">Se déconnecter</a>
</nav>

<div class="main-content">
    <h1>Modification emploi du temps</h1>
    <section class="emploi-du-temps">
        <div id='calendar'></div>
    </section>
</div>

<script>
    $(document).ready(function() {
        var events = [
            <c:forEach var="course" items="${cours}">
            {
                title: "${course.nom} \n ${course.enseignant.nom} ${course.enseignant.prenom} \n ${course.salle}",
                start: '${course.id.date}T${course.id.horaire}', // Heure de début
                end: moment('${course.id.date}T${course.id.horaire}').add(2, 'hours').format('YYYY-MM-DDTHH:mm:ss'),  // Heure de fin (ajoute 2 heures)
                description: 'Enseignant: ${course.enseignant.nom}, Salle: ${course.salle}',  // Description de l'événement
                id: '${course.id.date}_${course.id.horaire}',  // Identifiant unique basé sur la date et l'heure
                enseignantEmail: '${course.enseignant.email}',  // Email de l'enseignant
                nomMatiere: '${course.nom}',  // Nom de la matière
                date: '${course.id.date}',  // Date
                horaire: '${course.id.horaire}',  // Horaire
                salle: '${course.salle}'  // Salle
            },
            </c:forEach>
        ];

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
            },

            // Fonction déclenchée lorsqu'un événement est cliqué
            eventClick: function(event, jsEvent, view) {
                // Créer l'URL avec les paramètres nécessaires pour la page /updateCourses
                var updateUrl = '<%= request.getContextPath() %>/updateCourse?enseignantEmail=' + encodeURIComponent(event.enseignantEmail) +
                    '&nomMatiere=' + encodeURIComponent(event.nomMatiere) +
                    '&date=' + encodeURIComponent(event.date) +
                    '&horaire=' + encodeURIComponent(event.horaire) +
                    '&salle=' + encodeURIComponent(event.salle);

                // Rediriger vers la page de mise à jour des cours
                window.location.href = updateUrl;
            }
        });
    });

</script>

</body>
</html>
