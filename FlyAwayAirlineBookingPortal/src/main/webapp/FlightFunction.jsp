<%@page import="com.portal.services.FlightsService"%>
<%@page import="com.portal.models.Flights"%>
<%
String airlineid = request.getParameter("ddlairlinename");
int a_id = Integer.parseInt(airlineid);
String source = request.getParameter("ddlsource");
String destination = request.getParameter("ddldestination");
String date = request.getParameter("txtdate");
String time = request.getParameter("txttime");
String pr = request.getParameter("txtprice");
Flights flights = new Flights();
FlightsService flightsService = new FlightsService();
flights.setAirline_id(a_id);
flights.setSource(source);
flights.setDestination(destination);
flights.setDate(date);
flights.setTime(time);
flights.setPrice(Float.parseFloat(pr));
flightsService.addFlights(flights);
response.sendRedirect("FlightsInput.jsp");
%>