<%@page import="com.portal.models.AdminLogin"%>
<%@page import="com.portal.services.AdminLoginServices"%>
<%
String email = request.getParameter("txtemail");
String password= request.getParameter("txtpwd");
AdminLoginServices as = new AdminLoginServices();
AdminLogin a = new AdminLogin();
a.setUsername(email);
a.setPassword(password);
as.addAdmins(a);
response.sendRedirect("Login.jsp");

%>
