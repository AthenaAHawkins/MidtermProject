<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootStrapHead.jsp"/>
</head>
<body>
	<h2>User Successfully added</h2>
	<jsp:include page="navbar.jsp"/>


	<button onclick="redirectToAccount()">Back to Account</button>

	<script>
		function redirectToAccount() {
			window.location.href = 'account.do';
		}
	</script>
	<jsp:include page="bootStrapFoot.jsp"/>

</body>
</html>
