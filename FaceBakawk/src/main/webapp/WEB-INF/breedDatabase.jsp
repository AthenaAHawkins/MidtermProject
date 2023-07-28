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
            <thead>
            <tr>
            
          <th><br><a href="getBreed.do?breedId=${breed.id}">${breed.name}</a></th>
          </tr>
            <tbody>
        <tr>
         
            <td><img src="${breed.pictureURL}" alt="Chicken Picture" width="200" height="150"></td>
            <td>${breed.characteristic}</td>
            
        </tr>
            </tbody>
    </c:forEach>
</table>
<jsp:include page="bootStrapHead.jsp"/>
</body>
</html>