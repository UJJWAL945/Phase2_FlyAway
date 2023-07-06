<%@page import="com.portal.services.CustomerDetailsService"%>
<%@page import="com.portal.models.CustomerDetails"%>
<%@page import="com.portal.models.Flights"%>
<%
Flights flight = (Flights)session.getAttribute("Flight");
String cname = request.getParameter("txtcname");
String email = request.getParameter("txtemail");
String phonenumber = request.getParameter("phonenumber");
String gender = request.getParameter("gender");
String numberOfPassangers = request.getParameter("numberOfPassangers");
int numOfPassengers = Integer.parseInt(numberOfPassangers);
float price = flight.getPrice();
Float totalprice = numOfPassengers*price;
CustomerDetails cd = new CustomerDetails();
CustomerDetailsService cs = new CustomerDetailsService();
cd.setC_name(cname);
cd.setEmail(email);
cd.setPhonenum(phonenumber);
cd.setGender(gender);
cd.setNumberOfPassenger(numOfPassengers);
cd.setTotalfare(totalprice);
cd.setFlight_no(flight.getFlight_no());
cs.addCustomerDetails(cd);
session.setAttribute("Customer", cd);
response.sendRedirect("PaymentPage.jsp");

%>