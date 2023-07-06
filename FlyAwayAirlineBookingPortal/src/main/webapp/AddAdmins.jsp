<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Admins</title>
<link rel = "stylesheet" href="style.css">
</head>
<body>
<h1> Fly Away </h1>
<h3> An Airline Booking Portal</h3>
<div id="form">
<h3> Add Admin </h3>
<form action = "addAdminsfunction.jsp" method = "post">
<br></br>
<input type="text" placeholder="Enter Email id" name = "txtemail">
<br></br>
<input type="password" placeholder="Enter Password" name="txtpwd">
<br></br>
<button type="submit" id="loginbutton">ADD </button>
<br></br>
</form></div>

</body>
</html>