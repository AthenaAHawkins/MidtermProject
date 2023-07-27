<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <title>Chicken Pairs</title>
   <jsp:include page="bootStrapHead.jsp"/>
<link rel="stylesheet" href="css/matchmaker.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
   <h1>Chicken Pairs</h1>

   <table>
       <c:forEach var="pair" items="${matchedPairs}">
           <tr>
               <td>${pair[0].name}</td>
               <td><img	src="https://png.pngtree.com/png-vector/20190909/ourmid/pngtree-red-heart-icon-isolated-png-image_1726594.jpg" alt="Chicken Picture" width="100" height="75"></td>
               <td>${pair[1].name}</td>
           </tr>
       </c:forEach>
   </table>
   <jsp:include page="bootStrapFoot.jsp"/>
</body>
</html>