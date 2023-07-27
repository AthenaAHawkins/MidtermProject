<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chicken tenderized!</title>
<jsp:include page="bootStrapHead.jsp" />
<link rel="stylesheet" href="<c:url value="/static/css/navbar.css"/>">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h1>Chicken has been tenderized!</h1>
<br>
<img alt="chickentendies" src="https://www.marionskitchen.com/wp-content/uploads/2023/02/Asian-Buffalo-Wings-04.jpg" height="300px" width="300px">




<jsp:include page="bootStrapFoot.jsp" />
</body>
</html>