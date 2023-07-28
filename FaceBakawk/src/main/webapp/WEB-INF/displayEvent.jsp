<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>
<jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="css/displayEvent.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>

	<h2> ${event.title} </h2>
	<img src="${event.pictureURL}" alt="${event.title}" width="300"
		height="200"> 
		<br>
	
	Event Creator: 
	 <a href="getUser.do?userId=${event.creator.id}">${event.creator.username}</a>
	 <br>
	 <br>
	 <br>
	 <div class="eventBackground">
	 <p><em>Description: ${event.description } </em></p>
	 <p><em>When: ${event.eventDate } </em></p>
	 <p><em>Where: ${event.address.city }, ${event.address.state }, Street: ${event.address.street } </em></p>
	 </div>


				<c:if test="${not empty sessionScope.loggedInUser }">
	
					<form action="rsvp.do" method="POST">
					<input type="hidden" name="eventId" value="${event.id }"><br>
					<input type="hidden" name="userId" value="${sessionScope.loggedInUser.id }"><br>
					
					  <input class="btn btn-success" type="submit" value="RSVP to event">
					  
					 </form>
				 </c:if>
<br>
<h4>Tendies:</h4>
<div class="tendieBackground">
			<c:forEach var="attendee" items="${event.attendees}">
			<div class="centered">
					<ul>
					<li>
					<img src="${attendee.pictureURL }" alt="This you?"
					width="30" height="30">
					<a href="getUser.do?userId=${attendee.id}">${attendee.username}
					
					</a>
					</li>
					</ul>
			</div>
			</c:forEach>
	</div>

<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>