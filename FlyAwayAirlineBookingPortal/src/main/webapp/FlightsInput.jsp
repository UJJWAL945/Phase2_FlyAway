<%@page import="com.portal.models.Flights"%>
<%@page import="com.portal.services.SourceAndDestinationService"%>
<%@page import="com.portal.models.SourceAndDestination"%>
<%@page import="com.portal.models.Airline"%>
<%@page import="java.util.List"%>
<%@page import="com.portal.services.AirlineService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Input</title>
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
<form action = "FlightFunction.jsp" method = "post">
<br></br>
<h3>Add Flight Details</h3>
<label id="airlinename">Select Airlines: </label>
<select name="ddlairlinename" style="width:150px" id = "airlinename">
	<option value="-1">Select Airline</option>
	
	<%
	AirlineService as = new AirlineService();
	List<Airline> aall = as.showallAirline();
	for(Airline a : aall)
	{
	%>
		<option value='<%=a.getAirline_id()%>'>
				<%=a.getAirline_name() %>
		</option>
	<%
	}
	%></select>
	<br></br>
	<label id="source">From : </label>
<select name="ddlsource" style="width:150px" id = "source">
	<option value="-1">Select Source city</option>
	
	<%
	SourceAndDestinationService ss = new SourceAndDestinationService();
	List<SourceAndDestination> sall = ss.showAllSourceAndDestination();
	for(SourceAndDestination s : sall)
	{
	%>
		<option value='<%=s.getCity()%>'>
				<%=s.getCity() %>
		</option>
	<%
	}
	%></select>
	<br></br>
	<label id="Destination">To : </label>
<select name="ddldestination" style="width:170px" id = "Destination">
	<option value="-1">Select Destination city</option>
	
	<%
	SourceAndDestinationService sa = new SourceAndDestinationService();
	List<SourceAndDestination> ssall = sa.showAllSourceAndDestination();
	for(SourceAndDestination s : ssall)
	{
	%>
		<option value='<%=s.getCity()%>'>
				<%=s.getCity() %>
		</option>
	<%
	}
	%></select>
	<br></br>
	<label id="price">Enter Fare: </label>
<input type="text" placeholder="Enter Fare in Rs" name = "txtprice" id="price">
<br></br>
	<label id="date">Select Date: </label>
<input type="date" placeholder="Enter Date" name = "txtdate" id="date">
<label id="time">Select Time: </label>
<input type="time" placeholder="Enter time" name = "txttime" id="time">
<button type="submit" id="loginbutton">Submit</button>
<br></br>
</form></div>
<table id="output">
<tr>
<th>Airline Id</th>
<th>Airline Name</th>
<th>Flight_no</th>
<th>Source City</th>
<th>Destination City</th>
<th>Date</th>
<th>Time</th>
<th>Fare</th>
</tr>
<%try{ 
 AirlineService airlineService = new AirlineService();
 List<Airline> airlines = airlineService.showallAirline();
		 for(Airline a: airlines){
			 for(Flights f: a.getFlights()){
	 %>
<tr>
<td><%=a.getAirline_id() %> </td>
<td><%=a.getAirline_name() %></td>
<td><%=f.getFlight_no() %></td>
<td><%=f.getSource() %></td>
<td><%=f.getDestination() %></td>
<td><%=f.getDate()%></td>
<td><%=f.getTime()%></td>
<td><%=f.getPrice()%> Rs</td>
</tr> 
<% }}}
catch(Exception ex){
ex.printStackTrace();
}%>
</table>
</body>
</html>