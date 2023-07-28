<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>


<link rel="stylesheet" href="css/account.css">
<jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="<c:url value="/static/css/navbar.css"/>">
</head>

<body id="accountpage">

	<%--Edit the file nav.jsp to change nav links --%>
	<jsp:include page="navbar.jsp" />
<div class="container" >
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser }">
			<h2 class="unique-text">Your Account Details</h2>
			<%-- Output user details --%>

	     <ul class="no-bullet">
           <li><img src="${loggedInUser.pictureURL }" alt="This you?" width="300" height="200"></li>
           <li>UserName: ${loggedInUser.username }</li>
           <li>FirstName: ${loggedInUser.firstName }</li>
   		   <li>LastName: ${loggedInUser.lastName }</li>
           <li>city: ${loggedInUser.address.city }</li>
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
			<c:forEach var="chicken" items="${loggedInUser.chickens}">
			<c:if test="${chicken.enabled == true }">
				<tr>
					<td><a href="getChicken.do?chickenId=${chicken.id}">
							${chicken.name}</a></td>
					<td><c:choose>
							<c:when test="${not empty chicken.pictureURL}">
								<a href="getChicken.do?chickenId=${chicken.id}"> <img
									src="${chicken.pictureURL}" alt="Chicken Picture" width="300"
									height="200"></a>
							</c:when>
							<c:otherwise>
								<a href="getChicken.do?chickenId=${chicken.id}"> <img
									src="${chicken.breed.pictureURL}" alt="Breed Picture"
									width="300" height="200"></a>
							</c:otherwise>
							
						</c:choose></td>
						<td><a href="goToUpdateChicken.do?chickenId=${chicken.id}">
							Update Chicken Info</a></td>
							<td>
							<form action="disbaleChicken.do" method="post">
			<input type="hidden" name="chickenId" value="${chicken.id }">
			<button class="btn btn-danger" >Turn into Tendies</button>
		</form>
							</td>
						
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>


	<br>
	<h2 class="unique-text">Events Attended</h2>

	<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="event" items="${loggedInUser.eventsAttended}">
				<tr>
					<td><a href="displayEvent.do?eventId=${event.id}">
							${event.title}</a></td>
					<td><img src="${event.pictureURL}" alt="${event.title}"
						width="300" height="200"></td>
						
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<br>
	<h2 class="unique-text">Events Created</h2>
	<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="event" items="${loggedInUser.eventsCreated}">
		<c:if test="${event.enabled == true }">
				<tr>
					<td><a href="displayEvent.do?eventId=${event.id}">
							${event.title}</a></td>
					<td><img src="${event.pictureURL}" alt="${event.title}"
						width="300" height="200"></td>
					<td>
						<a href="updateEventButton.do?eventId=${event.id }">edit event</a>
					
					<br> 
						<form action="deleteEvent.do" method="post">
							<input type="hidden" name="eventId" value="${event.id }">
							<button class="btn btn-danger" >Terminate the event</button>
						</form>
					</td>
				</tr>
		</c:if>
			</c:forEach>
		</tbody>
	</table>
	

	<h3 class="unique-text">Update Your Info</h3>
	<form action="updateUserAccount.do" method="post">
    <div class="form-group">
        <label for="firstName">Enter your new first Name:</label>
        <input type="text" class="form-control" name="firstName" value="${loggedInUser.firstName}">
    </div>

    <div class="form-group">
        <label for="lastName">Enter your new last Name:</label>
        <input type="text" class="form-control" name="lastName" value="${loggedInUser.lastName}">
    </div>

    <div class="form-group">
        <label for="username">Enter your new username:</label>
        <input type="text" class="form-control" name="username" value="${loggedInUser.username}">
    </div>

    <div class="form-group">
        <label for="password">Enter your new password:</label>
        <input type="text" class="form-control" name="password" value="${loggedInUser.password}">
    </div>

    <div class="form-group">
        <label for="pictureURL">Enter your new picture URL:</label>
        <input type="text" class="form-control" name="pictureURL" value="${loggedInUser.pictureURL}">
    </div>
   
    <div class="form-group">
        <label for="description">Enter your new description:</label>
        <textarea rows="3" class="form-control" name="description">${loggedInUser.description}</textarea>
    </div>

    <div class="form-group">
        <label for="street">Enter the new Street:</label>
        <input type="text" class="form-control" name="street" value="${loggedInUser.address.street}">
    </div>

    <div class="form-group">
        <label for="city">Enter the new City:</label>
        <input type="text" class="form-control" name="city" value="${loggedInUser.address.city}">
    </div>

    <div class="form-group">
        <label for="state">Enter the new state:</label>
        <input type="text" class="form-control" name="state" value="${loggedInUser.address.state}">
    </div>

    <div class="form-group">
        <label for="country">Enter the new country:</label>
        <input type="text" class="form-control" name="country" value="${loggedInUser.address.country}">
    </div>

    <button type="submit" class="btn btn-primary">Update User Info</button>

<<<<<<< HEAD

	<h3>Update Your Info</h3>
		


				<label for=firstName>Enter in your new first Name: </label>
				<br>
				 <input
					type="text" class="form-control" name="firstName"
					value="${loggedInUser.firstName }">

				<label for=lastName>Enter in your new last Name: </label>
				<br>
				 <input
					type="text" class="form-control" name="lastName"
					value="${loggedInUser.lastName }">


				<label for="username">Enter in the new username: </label>
				<br>
				 <input
					type="text" class="form-control" name="username"
					value="${loggedInUser.username }">
				<br> 
				<label
					for="password">Enter in the new password: </label> 
					<br>
					<input
					type="text" class="form-control" name="password"
					value="${loggedInUser.password }">
					<br> 
				<label
					for="pictureURL">Enter in the new pic: </label> 
					<br>
					<input
					type="text" class="form-control" name="pictureURL"
					value="${loggedInUser.pictureURL }">
					<br> 
					<label 
					for="description">Enter in new description: 
					</label>
					<br>
				<textarea rows="3" cols="50" name="description">${loggedInUser.description }</textarea>
				<br> <label for="street">Enter in the new Street: </label> <br><input
					type="text" name="street" value="${loggedInUser.address.street }"><br>
				<br> <label for="city">Enter in the new City: </label><br> <input
					type="text" name="city" value="${loggedInUser.address.city }">
					<br>
					<br>
<form action="updateUserAccount.do" method="post">
=======
>>>>>>> a6d0b0369700fc5b7a305aeace24e09ac4075114


				


		</form>
					<br>
		<form action="disbaleUser.do" method="post">
			<input type="hidden" name="userId" value="${loggedInUser.id }">
			<button class="btn btn-danger" >Deactivate Account</button>
		</form>
</div>
	<jsp:include page="bootStrapFoot.jsp" />
</body>
</html>