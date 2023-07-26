<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>

</head>
<body>

<div>
    <form action="addChicken.do" method="POST">

  <h2>Tell us about your chicken:</h2>
		
		<input type="hidden" name="userId" value ="${owner.id}">
		
		<label for="name">*Name:</label><br>
		<input type="text" name="name" required><br>
 		
 		<label for="birthday">Birthday:</label><br>
		<input type="date" name="birthday"  ><br> 
		
		<label for="description">About your chicken:</label><br>
		<textarea name="description" rows="5" cols="40"></textarea><br>

		<label for="pictureURL">Image URL:</label><br>
		<input type="text" name="pictureURL"><br>

		<label for="musicTaste">Music Taste:</label><br>
		<input type="text" name="musicTaste"  ><br>
		
		<label for="gender">Gender:</label><br>
        <select name="gender" required>
        <option value="">Select an option</option>
        <option value="M">Male</option>
        <option value="F">Female</option>
        </select><br>

		<br>
		<label for="height">Height in Inches:</label><br>
		<input type="number" name="height"  ><br>
		
		<label for="wantsChicks">Do you want chicks?:</label><br>
		<input type="radio" name="wantsChicks" value="true"  >Yes<br>
		<input type="radio" name="wantsChicks" value="false"  >No!!!!<br>
		<!-- <input type="checkbox" id="wantsChicks">	
		<label for="wantsChicks">Yes</label> -->
		
		<h2>Breed:</h2>
		
		<select name="breed.id">
		<c:forEach var="breed" items="${breedList }">
		<option value="${breed.id }">${breed.name }</option>
		
		</c:forEach>
		</select>
	<%-- 	<input type="hidden" name="breedId" value="${breed.id} ">
		
		<label for="name">Breed Name:</label><br>
		<input type="text" name="name"  ><br>
		
		<label for="characteristics">Breed Characteristics:</label><br>
		<input type="text" name="characteristics" ><br>
		
		<label for="pictureURL">Breed Picture URL:</label><br>
		<input type="text" name="pictureURL" ><br> --%>
		
        <input type="submit" value="Add">
        <br>
        <br>
        <h6>*Required Field</h6>
        <a href="account.do">Back to Home</a>
            </form>
</div>

</body>
</html>