
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" import="javax.servlet.http.HttpSession"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");

	PreparedStatement ps = conn.prepareStatement("DELETE FROM complaints WHERE cid=?");
	ps.setInt(1, cid);

	int x = ps.executeUpdate();
	HttpSession httpsession;

	if (x > 0) {
		httpsession = request.getSession();
		response.sendRedirect("complaints.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("complaints.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>