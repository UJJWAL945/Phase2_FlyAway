
<%@page import="com.portal.services.AdminLoginServices"%>
<%@page import="com.portal.models.AdminLogin"%>
<% 
String email = request.getParameter("txtemail");
String password = request.getParameter("txtpwd");
AdminLoginServices as = new AdminLoginServices();
AdminLogin a = as.checkCredentials(email, password);
if(a!=null){
	String name = a.getUsername();
	session.setAttribute("name", name);
	response.sendRedirect("AdminHomePage.jsp");
}
else{
	out.print("<h2> Invalid username or password!! Try Again </h2>");
	response.sendRedirect("Login.jsp");
}

%>