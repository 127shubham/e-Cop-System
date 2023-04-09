<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="javax.servlet.http.HttpSession"%>

<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String role = request.getParameter("role");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String password = request.getParameter("password");

try {	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "root");

	PreparedStatement ps = conn
	.prepareStatement("insert into user(name,email,role,phone,address,password) values (?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, role);
	ps.setString(4, phone);
	ps.setString(5, address);
	ps.setString(6, password);

	int x = ps.executeUpdate();
	HttpSession httpsession;	

	if (x > 0) {
		httpsession = request.getSession();
		httpsession.setAttribute("reg-success", "Registration Successful...");
		response.sendRedirect("registerform.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("registerform.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>
