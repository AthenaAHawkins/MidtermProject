<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<jsp:include page="bootStrapHead.jsp"/>


</head>
<body>
<jsp:include page="navbar.jsp"/>



<div>
    <form action="register.do" method="POST">

  <h2>Tell us about yourself:</h2>
		
		<label for="firstName">First Name:</label><br>
		<input type="text" name="firstName"  ><br>
		
		<label for="lastName">Last Name:</label><br>
		<input type="text" name="lastName"  ><br>
		
		<label for="description">*Profile Description:</label><br>
		<textarea name="description" required rows="5" cols="40"></textarea><br>


		<label for="pictureURL">Image URL:</label><br>
		<input type="text" name="pictureURL"><br>

		<label for="username">*Username:</label><br>
        <input type="text" name="username" required><br>

		
		<label for="password">*Password:</label><br>
		<input type="text" name="password" required><br>
		
		<h2>Address:</h2>
		
		
		<label for="street">Street:</label><br>
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
        <h6>*Required Field</h6>
        <br>
        <br>
       
            </form>
</div>
<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>