<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create An Event</title>
<jsp:include page="bootStrapHead.jsp"/>

</head>
<body>
<jsp:include page="navbar.jsp"/>
<div>
    <form action="addEvent.do" method="POST">

  <h2>Tell us about your event:</h2>
		
		<input type="hidden" name="eventId" value ="${event.id}">
		
		<label for="title">Title:</label><br>
		<input type="text" name="title"  ><br>
 		
		<label for="description">About your Event:</label><br>
		<textarea name="description" rows="5" cols="40"></textarea><br>
		
		<label for="description">Show us a picture of what to expect at this event:</label><br>
		<textarea name="description" rows="5" cols="40">${event.pictureURL }</textarea><br>
 		
 		
 		
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
		
		<label for="street">Street:</label><br>
		<input type="text" name="street"  ><br>
		
		<label for="city">City:</label><br>
		<input type="text" name="city"  ><br>
		
		<label for="state">State</label><br>
		<input type="text" name="state" ><br>
		
		<label for="country">Country:</label><br>
		<input type="text" name="country" ><br>
		
		<label for="zipcode">Zipcode:</label><br>
		<input type="text" name="zipcode" ><br>
		
		<label for="eventDate">*Event Date:</label><br>
        <input type="date" name="eventDate" required ><br> 
		
		<label for="startTime">*Start Time:</label><br>
        <input type="time" name="startTime" required ><br> 
		
        <input type="submit" value="Add">
        <br>
        <br>
        <h6>*Required Field</h6>
        <a href="account.do">Back to Home</a>
 		
            </form>
</div>
<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>