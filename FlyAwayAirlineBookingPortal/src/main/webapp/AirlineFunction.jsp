<%@page import="com.portal.models.Airline"%>
<%@page import="com.portal.services.AirlineService"%>
<%
 String airlinename = request.getParameter("txtaline");
 AirlineService airlineService = new AirlineService();
 Airline airline = new Airline();
 airline.setAirline_name(airlinename);
 airlineService.addAirline(airline);
 response.sendRedirect("AirlineInput.jsp");
%>