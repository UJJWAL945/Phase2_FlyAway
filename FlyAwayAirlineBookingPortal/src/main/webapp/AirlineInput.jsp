<%@page import="com.portal.models.Airline"%>
<%@page import="java.util.List"%>
<%@page import="com.portal.services.AirlineService"%>
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
<div id="form">
<jsp:include page="links.jsp"/>
<form action = "AirlineFunction.jsp" method = "post">
<br></br>
<h3>Add Airlines</h3>
<input type="text" placeholder="Enter Airline Name" name = "txtaline">
<button type="submit" id="loginbutton">Submit</button>
<br></br>
</form></div>
<table id="output">
<tr>
<th>Airline_id</th>
<th>Airline Name</th>
</tr>
<%try{ 
 AirlineService airlineService = new AirlineService();
 List<Airline> airlines = airlineService.showallAirline();
		 for(Airline a: airlines){
	 %>
<tr>
<td><%=a.getAirline_id() %> </td>
<td><%=a.getAirline_name() %></td>
</tr> 
<% }}
catch(Exception ex){
ex.printStackTrace();
}%>
</table>
</body>
</html>