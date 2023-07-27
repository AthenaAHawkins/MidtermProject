<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Log In</title>
	<jsp:include page="bootStrapHead.jsp"/>
	<link rel="stylesheet" href="css/login.css">
	
	
	

	
	
</head>
<body>
	<jsp:include page="navbar.jsp"/>
<div class="container">
	<%--Edit the file nav.jsp to change nav links --%>
	
	<h2>Log In</h2>
	
	<form action="login.do" method="post">
		<input type="text" name="username"> 
		<input type="password" name="password" /> 
		<input type="submit" value="Log In">
	</form>
	
	<a href="goToAddUser.do">Create Account</a>
	
</div>
	<jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>