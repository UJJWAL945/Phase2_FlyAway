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
<h4> Congratulation <%=cd.getC_name() %> your booking is confirmed. Tickets are sent to your email and phone number.</h4>
<label for="output">Flight Details</label>
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
<table id="output2">
  <label for="output2">Customer Details</label>
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

<br><br>

<h3 id="bookanother"><a href="FlightSearchPage.jsp" id="bookanother"> Click here to book another flight</a></h3>
</body>
</html>
