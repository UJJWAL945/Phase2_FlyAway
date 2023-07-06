<%@page import="com.portal.models.Airline"%>
<%@page import="com.portal.services.AirlineService"%>
<%@page import="com.portal.models.Flights"%>
<%@page import="com.portal.services.FlightsService"%>
<% Flights flight = (Flights)session.getAttribute("Flight");
   AirlineService as = new AirlineService();
   Airline aline = as.searchAirline(flight.getAirline_id());
%>
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
<h1> Fly Away </h1>
<h3> An Airline Booking Portal</h3>
<br>
<h3> Confirm Travel Details and add passengers details</h3>
<div id="flightdetails">
<h4> <%=flight.getSource() %> to <%=flight.getDestination() %></h4>
<h4> Travel Date :- <%=flight.getDate() %> at <%=flight.getTime() %></h4>
<h4> Flight Details :- <%=aline.getAirline_name()%> - <%=flight.getFlight_no() %></h4>
</div>

<h3>Enter your details </h3>
<form action="CustomerDetailsFunction.jsp" method="post" id="customerform">
<input type="text" name = "txtcname" placeholder="Enter your name" style="width:170px">
<br></br>
<input type="email" name="txtemail" placeholder = "Enter your Email" style="width:170px">
<br></br>
<input type="number" name="phonenumber" placeholder="Enter Your Phone number" style="width:170px">
<br></br>
<label>Select Gender: &nbsp;</label>
<input type="radio" name="gender" id="male" value="Male" >
<label for="male">Male</label>
<input type="radio" name="gender" id="female" value="Female">
<label for="female">Female</label>
<input type="radio" name="gender" id="others" value="Others">
<label for="others">Others</label>
<br></br>
<label for="numberofpassengers">Enter Number of Passengers: </label>
<input type="number" name ="numberOfPassangers"  id="numberofpassengers" style="width:30px">
<br></br>
<button type="submit">Submit</button>
</form >




</body>
</html>