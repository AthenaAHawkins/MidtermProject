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
	 <p><em>Where: ${event.address.city }, ${event.address.state } </em></p>






	<%-- </c:forEach> --%>



</body>
</html>