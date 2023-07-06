<%@page import="com.portal.services.SourceAndDestinationService"%>
<%@page import="com.portal.models.SourceAndDestination"%>
<% 
String city = request.getParameter("txtcity");
SourceAndDestination sn = new SourceAndDestination();
sn.setCity(city);
SourceAndDestinationService sc = new SourceAndDestinationService();
sc.addSourceAndDestination(sn);
response.sendRedirect("SourceAndDestinationInput.jsp");
%>