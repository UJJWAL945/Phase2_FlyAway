<!DOCTYPE html>
<%@page import="com.portal.services.AirlineService"%>
<%@page import="com.portal.models.Airline"%>
<%@page import="com.portal.models.CustomerDetails"%>
<%@page import="com.portal.models.Flights"%>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Fly Away</h1>
<h3>An Airline Booking Portal</h3>
<br>
<% Flights flights = (Flights)session.getAttribute("Flight");
 CustomerDetails cd = (CustomerDetails)session.getAttribute("Customer");
 AirlineService as = new AirlineService();
 Airline a = as.searchAirline(flights.getAirline_id());
%>
<label for="output" id="dot">Flight Details</label>
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
  <tr>
    <td><%= a.getAirline_id() %></td>
    <td><%= a.getAirline_name() %></td>
    <td><%= flights.getFlight_no() %></td>
    <td><%= flights.getSource() %></td>
    <td><%= flights.getDestination() %></td>
    <td><%= flights.getDate() %></td>
    <td><%= flights.getTime() %></td>
    <td><%= flights.getPrice() %> Rs</td>
  </tr>
</table>

<br><br>
<label for="output2" id="id="dot">Customer Details</label>
<table id="output2" >
  
  <tr>
    <th>Customer Id</th>
    <th>Customer Name</th>
    <th>Email</th>
    <th>Phone Number</th>
    <th>Gender</th>
    <th>Travelers</th>
    <th>Total Fare</th>
  </tr>
  <tr>
    <td><%= cd.getC_id() %></td>
    <td><%= cd.getC_name() %></td>
    <td><%= cd.getEmail() %></td>
    <td><%= cd.getPhonenum() %></td>
    <td><%= cd.getGender() %></td>
    <td><%= cd.getNumberOfPassenger() %></td>
    <td><%= cd.getTotalfare() %> Rs</td>
  </tr>
</table>

<h3>Payment info:</h3>
<div id="payment">
<p>Fare: <%= flights.getPrice() %> Rs</p>
<p>Travelers: <%= cd.getNumberOfPassenger() %></p>
<p>Total Fare: <%= flights.getPrice() %> X <%= cd.getNumberOfPassenger() %> = <%= cd.getTotalfare() %> Rs</p>
<a href="Success.jsp" id="paymentbutton">Pay Now</a>
</div>
</body>
</html>
