<%@ page language="java" import="java.sql.*"
	import="javax.servlet.http.HttpSession"%>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
String subject = request.getParameter("subject");
String status = request.getParameter("status");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");

	PreparedStatement ps = conn
	.prepareStatement("update complaints set subject=?, status=? where cid=?");
	
	ps.setString(1, subject);
	ps.setString(2, status);
	ps.setInt(3, cid);

	int x = ps.executeUpdate();
	HttpSession httpsession;

	if (x > 0) {
		httpsession = request.getSession();
		httpsession.setAttribute("subject", subject);
		httpsession.setAttribute("status", status);
		response.sendRedirect("status.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("changestatusform.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>
