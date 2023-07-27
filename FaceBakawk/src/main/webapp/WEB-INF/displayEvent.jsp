<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>
<jsp:include page="bootStrapHead.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>

	<h1>Event Details</h1>



	<%-- <c:forEach var="event" items="${eventList}"> --%>

	<img src="${event.pictureURL}" alt="${event.title}" width="300"
		height="200"> 
	<h2> ${event.title} </h2>
	<br>
	Event Creator: 
	 <a href="getUser.do?userId=${event.creator.id}">${event.creator.username}</a>
	 <p><em>Description: ${event.description } </em></p>
	 <p><em>When: ${event.eventDate } </em></p>
	 <p><em>Where: ${event.address.city }, ${event.address.state }, Street: ${event.address.street } </em></p>


				<c:if test="${not empty sessionScope.loggedInUser }">
	
					<form action="rsvp.do" method="POST">
					<input type="hidden" name="eventId" value="${event.id }"><br>
					<input type="hidden" name="userId" value="${sessionScope.loggedInUser.id }"><br>
					
					  <input type="submit" value="RSVP to event">
					  
					 </form>
				 </c:if>


<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="attendee" items="${event.attendees}">
				<tr>
					<td><img src="${attendee.pictureURL }" alt="This you?"
					width="30" height="30"><a href="getUser.do?userId=${attendee.id}">${attendee.username}</a>
</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>

<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>