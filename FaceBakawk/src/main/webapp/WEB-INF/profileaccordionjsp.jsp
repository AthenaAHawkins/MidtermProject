<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>account accordion</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0" data-bs-theme="dark">
	<div class="accordion accordion-flush" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">
					Flock info</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
				<h2 class="unique-text">Your Chickens</h2>
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
						<td><a href="goToAddChicken.do">Create Chicken</a></td>
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
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="false" aria-controls="collapseTwo">
					Events</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
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
	<br>
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
						<td><a href="goToAddEvent.do">Create An Event</a></td>
					<td>
						<a href="updateEventButton.do?eventId=${event.id }">edit event</a></td>
					
					
						<td><form action="deleteEvent.do" method="post">
							<input type="hidden" name="eventId" value="${event.id }">
							<button class="btn btn-danger" >Terminate the event</button>
						</form>
					</td>
	
				</tr>
		</c:if>
			</c:forEach>
		</tbody>
	</table>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="false" aria-controls="collapseThree">
					Update User Info</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
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


		</form>
					<br>
		<form action="disbaleUser.do" method="post">
			<input type="hidden" name="userId" value="${loggedInUser.id }">
			<button class="btn btn-danger" >Deactivate Account</button>
		</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>