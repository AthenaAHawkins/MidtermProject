<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chicken Adding Error</title>
</head>
<body>
  <h1>Error adding chicken, please resubmit information</h1>
  <button onclick="goBack()">Go Back</button>

  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>
</html>
