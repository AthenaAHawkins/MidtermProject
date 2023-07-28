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
		
				<label for="name">*Name:</label><br>
		<input type="text" name="name" value="${chicken.name }" required><br>
 		
 		<label for="birthday">*Birthday:</label><br>
		<input id="birthday" type="date" name="birthday" value="${chicken.birthday }" required ><br> 
		
		<label for="description">About your chicken:</label><br>
		<textarea name="description" rows="5" cols="40" value="${chicken.description}" ></textarea><br>

		<label for="pictureURL">Image URL:</label><br>
		<input type="text" name="pictureURL value="${chicken.pictureURL }" "><br>

		<label for="musicTaste">Music Taste:</label><br>
		<input type="text" name="musicTaste" value="${chicken.musicTaste }"  ><br>
		
		<label for="gender">Gender:</label><br>
        <select name="gender" required>
        <option value="">Select an option</option>
        <option value="M">Male</option>
        <option value="F">Female</option>
        </select><br>

		<br>
		<label for="height">Height in Inches:</label><br>
		<input type="number" name="height" value="${chicken.height }"  ><br>
		
		<label for="wantsChicks">Do you want chicks?:</label><br>
		<input type="radio" name="wantsChicks" value="true"  >Yes<br>
		<input type="radio" name="wantsChicks" value="false"  >No!!!!<br>
		<h2>Breed:</h2>
		
		<select name="breed.id">
		<c:forEach var="breed" items="${breedList }">
		<option value="${breed.id }">${breed.name }</option>
		
		</c:forEach>
		</select>
        <input type="submit" value="Update">
        <br>
        <br>
        <h6>*Required Field</h6>
        
		</form>
				<form action="account.do" method="post">
			<button class="btn btn-success" >Back Home</button>
		</form>




	<jsp:include page="bootStrapFoot.jsp" />
</body>

</html>