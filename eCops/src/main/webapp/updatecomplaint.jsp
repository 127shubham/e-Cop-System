<%@ page language="java" import="java.sql.*"
	 import="javax.servlet.http.HttpSession"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
String subject = request.getParameter("subject");
String complainttype = request.getParameter("complainttype");
String complaintto = request.getParameter("complaintto");
String description = request.getParameter("description");
String location = request.getParameter("location");
String status = request.getParameter("status");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");

	PreparedStatement ps = conn
	.prepareStatement("update complaints set subject=?,complainttype=?,complaintto=?,location=?,description=? where cid=?");
	
	ps.setString(1, subject);
	ps.setString(2, complainttype);
	ps.setString(3, complaintto);
	ps.setString(4, location);
	ps.setString(5, description);
	ps.setInt(6, cid);

	int x = ps.executeUpdate();
	HttpSession httpsession;

	if (x > 0) {
		httpsession = request.getSession();
		httpsession.setAttribute("subject", subject);
		httpsession.setAttribute("complainttype", complainttype);
		httpsession.setAttribute("complaintto", complaintto);
		httpsession.setAttribute("description", description);
		httpsession.setAttribute("location", location);
		response.sendRedirect("complaints.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("updatecomplaintform.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>
