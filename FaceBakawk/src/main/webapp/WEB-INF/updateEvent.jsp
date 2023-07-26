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

<div>
    <form action="updateEvent.do" method="POST">

  <h2>Tell us about your event:</h2>
		
		<input type="hidden" name="eventId" value ="${event.id}">
		
		<label for="title">Title:</label><br>
		<input type="text" name="title" value="${event.title}" ><br>
 		
		<label for="description">About your Event:</label><br>
		<textarea name="description" rows="5" cols="40" value="${event.description}"></textarea><br>
 		
 		
 		
<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="currency" items="${event.currencies}">
				<tr>
				
		<td>	
		<select name="currency">
        <option value=>${event.currencies.type }</option>
        </select>
        </td>
				</tr>
		</c:forEach>
		</tbody>
</table>
	
	
	
 		
 		<h2>Address:</h2>
		
		<input type="hidden" name="addressId" value="${address.id} ">
		<input type="hidden" name="creatorId" value="${event.creator.id} ">
		
		<label for="street">street:</label><br>
		<input type="text" name="street" value="${event.street}"><br>
		
		<label for="city">City:</label><br>
		<input type="text" name="city" value="${event.city}" ><br>
		
		<label for="state">State</label><br>
		<input type="text" name="state" value="${event.state}"><br>
		
		<label for="country">Country:</label><br>
		<input type="text" name="country" value="${event.country}" ><br>
		
		<label for="zipcode">Zipcode:</label><br>
		<input type="text" name="zipcode" value="${event.zipcode}"><br>
		
		<label for="eventDate">*Event Date:</label><br>
        <input type="date" name="eventDate" required value="${event.eventDate}"><br> 
		
		<label for="startTime">*Start Time:</label><br>
        <input type="time" name="startTime" required value="${event.startTime}" ><br> 
		
        <input type="submit" value="Add">
        <br>
        <br>
        <h6>*Required Field</h6>
        <a href="displayEvent.do">Back to Home</a>
 		
            </form>
</div>


</body>
</html>