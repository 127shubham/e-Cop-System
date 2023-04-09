<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="javax.servlet.http.HttpServletResponse"%>
<%
int reqid = Integer.parseInt(request.getParameter("reqid"));
String requestfor = request.getParameter("requestfor");
String status = request.getParameter("status");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");

	PreparedStatement ps = conn.prepareStatement("update requests set requestfor=?,status=? where reqid=?");
	ps.setString(1, requestfor);
	ps.setString(2, status);
	ps.setInt(3, reqid);

	int x = ps.executeUpdate();
	HttpSession httpsession;

	if (x > 0) {
		httpsession = request.getSession();
		httpsession.setAttribute("requestfor", requestfor);
		httpsession.setAttribute("status", status);
		response.sendRedirect("requests.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("reqstatusform.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>
