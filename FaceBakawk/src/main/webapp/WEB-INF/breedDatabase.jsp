<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Chicken Breeds</title>
<jsp:include page="bootStrapHead.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<table>
    <c:forEach items="${breedList}" var="breed">
        <tr>
            <td><a href="displayPost.do?postId=${breed.id}">${breed.name}</a></td>
            <td>${breed.charcteristics}</td>
            <td>${breed.pictureUrl}</td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="bootStrapHead.jsp"/>
</body>
</html>