<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Chicken Details</h1>



	<%-- <c:forEach var="user" items="${userList}"> --%>

	<img src="${user.pictureURL}" alt="${user.name}" width="300"
		height="200"> 
	<h3>User Name:</h3>
	<h2>${user.username}</h2>
	<h2> ${user.firstName} , ${user.lastName }</h2>
	<br>Chicken:
	 <a href="getUser.do?userId=${user.chicken.id}"> ${user.chicken.username}</a>
	<br>Description:
	 ${user.description}
	<br> <h2>Events Attended</h2>
<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="events" items="${eventAttended}">
				<tr>
					<td><a href="getEvent.do?eventId=${event.id}"> ${event.name}</a></td>
					<td><img src="${event.pictureURL}"  alt="${event.name}"  width="300"
						height="200"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	

<h2>Flock</h2>
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
	


	<%-- </c:forEach> --%>



</body>
</html>