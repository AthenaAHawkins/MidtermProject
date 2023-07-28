<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT LIST</title>
<jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="<c:url value="/static/css/navbar.css"/>">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h1>Upcoming Events</h1>

<c:if test="${not empty sessionScope.loggedInUser}">
<br>
 <p><a href="goToAddEvent.do">Create an Event</a></p>
 
</c:if>


<table>
<thead>
<tr>
<th>
<u>Event Name:</u>
</th>
<th>
<u>Creator:</u>
</th>
<th>
<u>Start Date:</u>
</th>
</tr>

        <tbody>
    <c:forEach items="${eventList}" var="event">
    <c:if test="${event.enabled == true }">
        <tr>
            <td><a href="displayEvent.do?eventId=${event.id}">${event.title}</a></td>
            <td>${event.creator.username}</td>
            <td>${event.eventDate}</td>
        </tr>
    </c:if>
    </c:forEach>
     </tbody>
</table>



<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>