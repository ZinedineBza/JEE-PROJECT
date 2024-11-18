<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calendrier des Cours</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
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
    <c:forEach var="hour" items="${listCourses.horaire}">
        <tr>
            <td>${listCourses.horaire}</td>
            <c:forEach var="day" items="${listCourses.date}">
                <td>
                    <c:forEach var="course" items="${cours}">
                        <c:if test="${course.date == cours.date && course.horaire == cours.horaire}">
                            <div>${course.nom} - ${course.enseignant} - ${course.salle}</div>
                        </c:if>
                    </c:forEach>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
    </tbody>
</table>

<style>
    .calendar {
        width: 100%;
        border-collapse: collapse;
    }
    .calendar th, .calendar td {
        padding: 15px;
        border: 1px solid #ddd;
        text-align: center;
    }
    .calendar td {
        vertical-align: top;
    }
    .calendar td div {
        background-color: #f2f2f2;
        padding: 5px;
        margin-bottom: 5px;
    }
</style>
</body>
</html>
