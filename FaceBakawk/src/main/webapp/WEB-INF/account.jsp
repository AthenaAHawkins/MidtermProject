<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>
</head>
<body>

	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>

	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">
			<h2>Your Account Details</h2>
			<%-- Output user details --%>

			<ul>
			
				<li><img src="${loggedInUser.pictureURL }"  alt="This you?"  width="300"
						height="200"></li>
				<li>UserName: ${loggedInUser.username }</li>
				<li>FirstName: ${loggedInUser.firstName }</li>
				<li>LastName: ${loggedInUser.lastName }</li>
			</ul>
		</c:when>
		<c:otherwise>
			<h1>Not logged In.</h1>
		</c:otherwise>
	</c:choose>
	
<a href="goToAddChicken.do">Create Chicken</a>
<br>
<br>
<a href="goToAddEvent.do">Create An Event</a>


<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="chicken" items="${chickenList}">
				<tr>
					<td><a href="getChicken.do?chickenId=${chicken.id}"> ${chicken.name}</a></td>
					<td><img src="${chicken.pictureURL}"  alt="${chicken.name}"  width="300"
						height="200"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<br> <h2>Events Attended</h2>
<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="event" items="${eventList}">
				<tr>
					<td><a href="displayEvent.do?eventId=${event.id}"> ${event.title}</a></td>
					<td><img src="${event.pictureURL}"  alt="${event.title}"  width="300"
						height="200"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>
</html>