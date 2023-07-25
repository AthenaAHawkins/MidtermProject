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
    <form action="register.do" method="POST">

  <h2>Tell us about you:</h2>
		
		<label for="firstName">First Name:</label><br>
		<input type="text" name="firstName"  ><br>
		
		<label for="lastName">Last Name:</label><br>
		<input type="text" name="lastName"  ><br>
		
		<label for="description">Tell us about yourself:</label><br>
		<input type="text" name="description"  ><br>

		<label for="pictureURL">Image URL:</label><br>
		<input type="text" name="pictureURL"><br>

		<label for="username">Username:</label><br>
		<input type="text" name="username"  ><br>
		
		<label for="password">Password:</label><br>
		<input type="text" name="password"  ><br>
		
		<h2>Address:</h2>
		
		
		<label for="street">street:</label><br>
		<input type="text" name="street"  ><br>
		
		<label for="city">City:</label><br>
		<input type="text" name="city"  ><br>
		
		<label for="state">State</label><br>
		<input type="text" name="state" ><br>
		
		<label for="country">Country:</label><br>
		<input type="text" name="country" ><br>
		
		<label for="zipcode">Zipcode:</label><br>
		<input type="text" name="zipcode" ><br>
		
        <input type="submit" value="Add">
        <br>
        <br>
        <a href="home.do">Back to Home</a>
            </form>
</div>

</body>
</html>