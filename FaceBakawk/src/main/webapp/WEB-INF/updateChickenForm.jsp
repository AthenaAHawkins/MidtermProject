<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chicken Update Form</title>
<jsp:include page="bootStrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<form action="updateChickenInfo.do" method="post">
	<input type="hidden" name="id"  value="${chicken.id}" > 



		<h1>Update Chicken Information</h1>
		<br>
		
		
		<label for="name">Enter in the new Chicken Name: </label> <br>
		<input type="text" class="form-control" name="name"
			value="${chicken.name }"> <br> <label for="wantsChicks">Want
			Chicks? </label> <br> <input type="radio" name="wantsChicks"
			value="true">Yes<br> <input type="radio"
			name="wantsChicks" value="false">No<br> <br> <label
			for="description">Enter in new description: </label> <br>


		<textarea rows="3" cols="50" name="description">${chicken.description }</textarea>

		<br> <label for="pictureURL">Put a new profile picture
			URL: </label> <br>
		<input type="text" name="pictureURL" value="${chicken.pictureURL }"><br>



		<button class="btn btn-primary">Update Chicken Information</button>
		 
	</form>





	<jsp:include page="bootStrapFoot.jsp" />
</body>

</html>