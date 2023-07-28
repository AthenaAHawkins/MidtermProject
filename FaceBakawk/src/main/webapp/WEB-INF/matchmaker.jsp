<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Chicken Pairs</title>
<jsp:include page="bootStrapHead.jsp" />
<link rel="stylesheet" href="css/matchmaker.css">
</head>
<body>
	<jsp:include page="navbar.jsp" />
<br>
	<table>
	<c:choose>
	<c:when test="${not empty matchedPairs }">
	<h1>Clucking Great Couples</h1>
<br>
<br>
<br>
<br>
<br>


		<c:forEach var="pair" items="${matchedPairs}">
			<tr class="bg-image">
				<td><c:choose>
						<c:when test="${not empty pair[1].pictureURL}">
							<img src="${pair[1].pictureURL}" alt="Chicken Picture"
								width="300" height="200">
						</c:when>
						<c:otherwise>
							<img src="${pair[1].breed.pictureURL}" alt="Breed Picture" width="250" height="175">
						</c:otherwise>
					</c:choose></td>
					
				<td id="biggerName"><a id="biggerName" href="getChicken.do?chickenId=${pair[1].id}">${pair[1].name}</a><br>❤<br><a id="biggerName" href="getChicken.do?chickenId=${pair[0].id}">${pair[0].name}</a></td>
				     
					
				<td><c:choose>
						<c:when test="${not empty pair[0].pictureURL}">
							<img src="${pair[0].pictureURL}" alt="Chicken Picture"
								width="300" height="200">
						</c:when>
						<c:otherwise>
							<img src="${pair[0].breed.pictureURL}" alt="Breed Picture" width="300" height="200">
						</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
			</c:when>
			<c:otherwise>
			<h1>Love Is Blind, But Not That Blind</h1>
			<h5>* You need chickens in your coop.</h5>
			
			</c:otherwise>
			</c:choose>
	</table>
	<jsp:include page="bootStrapFoot.jsp" />
</body>
</html>