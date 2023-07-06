<%@page import="com.portal.models.SourceAndDestination"%>
<%@page import="java.util.List"%>
<%@page import="com.portal.services.SourceAndDestinationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="style.css">
</head>
<body>
<% 
String mail = (String)session.getAttribute("name");
if(mail==null){
	response.sendRedirect("Login.jsp");
}
%>
<h1> Fly Away </h1>
<h3> An Airline Booking Portal</h3>
<jsp:include page="links.jsp"/>
<div id="form">
<form action = "SourceAndDestinationFunction.jsp" method = "post">
<br></br>
<h3> Enter Cities Details</h3>
<input type="text" placeholder="Enter City" name = "txtcity">
<button type="submit" id="loginbutton">Submit</button>
<br></br>
</form></div>
<table id="output">
<tr>
<th>City Id</th>
<th>City Name</th>
</tr>
<%try{ 
 SourceAndDestinationService ss = new SourceAndDestinationService();
 List<SourceAndDestination> sall = ss.showAllSourceAndDestination();
 for(SourceAndDestination s: sall){
	 %>
<tr>
<td><%=s.getS_id() %> </td>
<td><%=s.getCity() %></td>
</tr> 
<% }}
catch(Exception ex){
ex.printStackTrace();
}%>
</table>
</body>
</html>