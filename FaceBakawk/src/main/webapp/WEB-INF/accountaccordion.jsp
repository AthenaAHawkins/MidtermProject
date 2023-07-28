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
<title>user Accordion</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0" data-bs-theme="dark">
	<div class="accordion accordion-flush" id="accordionFlushExample">
  
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Flock
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><h2>Flock</h2>
<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<c:forEach var="chicken" items="${user.chickens}">
			<c:if test="${chicken.enabled == true }">
				<tr>
					<td><a href="getChicken.do?chickenId=${chicken.id}"> ${chicken.name}</a></td>
					<td><img src="${chicken.pictureURL}"  alt="${chicken.name}"  width="300"
						height="200"></td>
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
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Events attended
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><h2>Events Attended</h2>
		<table class="table table-striped table-hover" id="eventAttendedTable">
			<thead class="table-dark">
			<c:forEach var="event" items="${user.eventsAttended}">
			<tbody>
					<tr>
						<td><a href="displayEvent.do?eventId=${event.id}"> ${event.title}</a></td>
						<td><img src="${event.pictureURL}"  alt="${event.title}"  width="300"
						height="200"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table></div>
    </div>
  </div>
</div>
</body>
</html>