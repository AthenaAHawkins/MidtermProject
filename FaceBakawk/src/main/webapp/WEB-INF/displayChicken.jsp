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
	<table class="table table-striped table-hover">
		<thead class="table-dark">
		<tbody>
			<%-- <c:forEach var="chicken" items="${chickenList}"> --%>
				<tr>
					<td><a href="getChicken.do?chickenId=${chicken.id}">
							${chicken.name}</a></td>
					<td><img src="${chicken.pictureURL}" alt="${chicken.name}"
						width="300" height="200"></td>








					<td>Birthday:<br> ${chicken.birthday}</td>
					<td>Height:<br> ${chicken.height} in.</td>
					<td>Gender:<br> ${chicken.gender}</td>
					<td>Music Taste: <br>${chicken.musicTaste}</td>
					<td>Do they want chicks?<br> ${chicken.wantsChicks}</td>
					<td>Owner:<br> ${chicken.owner.username}</td>
					<td>Breed: <br>${chicken.breed.name}</td>
					<td>Description:<br> ${chicken.description}</td>



				</tr>

			<%-- </c:forEach> --%>
		</tbody>
	</table>

</body>
</html>