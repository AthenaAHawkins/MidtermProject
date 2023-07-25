<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Chicken Added Succesfully</title>
</head>
<body>
  <h1>Chicken Added Successfully</h1>
  <button onclick="redirectToAccount()">Back to Account</button>

  <script>
    function redirectToAccount() {
      window.location.href = 'account.do';
    }
  </script>
</body>
</html>
