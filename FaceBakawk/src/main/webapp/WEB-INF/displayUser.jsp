<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User info</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<h1>User Details</h1>



	<%-- <c:forEach var="user" items="${userList}"> --%>


	<img src="${user.pictureURL}" alt="${user.username}" width="300"

		height="200"> 
	<h3>User Name: ${user.username}</h3>
	<h2>${user.username}</h2>
	<h2> ${user.firstName} , ${user.lastName }</h2>

	<br><h2>
	Chicken:
	<c:forEach var="chicken" items="${user.chickens}">
	 <a href="getChicken.do?chickenId=${chicken.owner.id}"> <img src="${chicken.pictureURL}"  alt="${chicken.name}"  width="300"
						height="200"></a><br>
	 
	 
	 </c:forEach></h2>
	<br>
	<h2>Description:
	 ${user.description}</h2>

	
	<br> <h2>Events Attended</h2>
<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="event" items="${user.events}">
				<tr>
					<td><a href="displayEvent.do?eventId=${event.id}"> ${event.title}</a></td>
					<td><img src="${event.pictureURL}"  alt="${event.title}"  width="300"
						height="200"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	

<h2>Flock</h2>
<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="chicken" items="${user.chickens}">
				<tr>
					<td><a href="getChicken.do?chickenId=${chicken.id}"> ${chicken.name}</a></td>
					<td><img src="${chicken.pictureURL}"  alt="${chicken.name}"  width="300"
						height="200"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	


	<%-- </c:forEach> --%>



</body>
</html>