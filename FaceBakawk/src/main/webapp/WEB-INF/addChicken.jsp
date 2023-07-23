<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>


</head>
<body>



<div>
    <form action="addChicken.do" method="POST">

  <h2>Tell us about you:</h2>
		
		<input type="hidden" name="userId" value ="${owner.id}">
		
		<label for="name">Name:</label><br>
		<input type="text" name="name"  ><br>
		
		<label for="birthday">Birthday:</label><br>
		<input type="date" name="birthday"  ><br>
		
		<label for="description">Tell us about yourself:</label><br>
		<input type="text" name="description"  ><br>

		<label for="pictureURL">Image URL:</label><br>
		<input type="text" name="pictureURL"><br>

		<label for="musicTaste">Music Taste:</label><br>
		<input type="text" name="musicTaste"  ><br>
		
		<select name="gender">
        <option value="M">Male</option>
        <option value="F">Female</option>
        </select>
		<br>
		<label for="height">Height in Inches:</label><br>
		<input type="number" name="height"  ><br>
		
		<label for="wantsChicks">Do you want chicks?:</label><br>
		<input type="checkbox" name="wantsChicks" value="true"  >Yes<br>
		<input type="checkbox" name="wantsChicks" value="false"  >No!!!!<br>
		<!-- <input type="checkbox" id="wantsChicks">	
		<label for="wantsChicks">Yes</label> -->
		
		<h2>Breed:</h2>
		
		<input type="hidden" name="breedId" value="${breed.id} ">
		
		<label for="name">Breed Name:</label><br>
		<input type="text" name="name"  ><br>
		
		<label for="characteristics">Breed Characteristics:</label><br>
		<input type="text" name="characteristics" ><br>
		
		<label for="pictureURL">Breed Picture URL:</label><br>
		<input type="text" name="pictureURL" ><br>
		
        <input type="submit" value="Add">
        <br>
        <br>
        <a href="home.do">Back to Home</a>
            </form>
</div>

</body>
</html>