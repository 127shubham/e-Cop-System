<%@ page language="java" import="java.sql.*"
	import="javax.servlet.http.HttpSession" import="java.io.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String message = request.getParameter("message");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");

		PreparedStatement ps = conn.prepareStatement("insert into contact(name,email,phone,message) values (?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, message);

		int x = ps.executeUpdate();
		HttpSession httpsession;

		if (x > 0) {
			httpsession = request.getSession();
			httpsession.setAttribute("msg-sent", "Sent Message...");
			response.sendRedirect("contactform.jsp");
		} else {
			httpsession = request.getSession();
			response.sendRedirect("contactform.jsp");
		}

	} catch (Exception e) {
		out.println(e);
	}
	%>