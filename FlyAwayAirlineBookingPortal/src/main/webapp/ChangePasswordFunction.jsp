<%@page import="com.portal.services.AdminLoginServices"%>
<%
String password = request.getParameter("txtpwd");
AdminLoginServices as = new AdminLoginServices();
String email = (String)session.getAttribute("name");
as.changePassword(password, email);
response.sendRedirect("Login.jsp");
%>