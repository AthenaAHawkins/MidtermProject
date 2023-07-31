<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Event</title>
<jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="<c:url value="/static/css/navbar.css"/>">
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div>
    <form action="updateEvent.do" method="POST">

  <h2>Tell us about your event:</h2>
		
		<input type="hidden" name="eventId" value ="${event.id}">
		
		<label for="title">Title:</label><br>
		<input type="text" name="title" value="${event.title}" ><br>
 		
		<label for="description">About your Event:</label><br>
		<textarea name="description" rows="5" cols="40">${event.description }</textarea><br>
		
		<label for="pictureURL">Show us a picture of what to expect at this event:</label><br>
		<input name="pictureURL" value="${event.pictureURL}"><br>
 		
 		
 		<h2>Address:</h2>
		
		<input type="hidden" name="id" value="${event.id} ">
		<input type="hidden" name="address.id" value="${event.address.id} ">
		<input type="hidden" name="creator.id" value="${event.creator.id} ">
		
		<label for="address.street">street:</label><br>
		<input type="text" name="address.street" value="${event.address.street}"><br>
		
		<label for="address.city">City:</label><br>
		<input type="text" name="address.city" value="${event.address.city}" ><br>
		
		<label for="address.state">State</label><br>
		<input type="text" name="address.state" value="${event.address.state}"><br>
		
		<label for="address.country">Country:</label><br>
		<input type="text" name="address.country" value="${event.address.country}" ><br>
		
		<label for="address.zipcode">Zipcode:</label><br>
		<input type="text" name="address.zipcode" value="${event.address.zipcode}"><br>
		
		<label for="eventDate">*Event Date:</label><br>
        <input type="date" name="eventDate" required value="${event.eventDate}"><br> 
		
		<label for="startTime">*Start Time:</label><br>
        <input type="time" name="startTime" required value="${event.startTime}" ><br> 
		
        <input type="submit" value="update">
        <br>
        <br>
        <h6>*Required Field</h6>
 		
            </form>
        <a href="home.do">Back to Home</a>
</div>

<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>