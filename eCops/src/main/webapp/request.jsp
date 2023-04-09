<%@ page language="java" import="java.sql.*"
	import="javax.servlet.http.HttpSession"%>
<%
String requestfor = request.getParameter("requestfor");
String requesttype = request.getParameter("requesttype");
String requestby = request.getParameter("requestby");
String location = request.getParameter("location");
String description = request.getParameter("description");
requestby = "Pravin Tidake";
String reqdate = new java.util.Date().toLocaleString();
String status = "Pending";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");

	if (description == null) {
		description = "";
	}

	PreparedStatement ps = conn.prepareStatement(
	"insert into requests(requestfor,requesttype,requestto,description,location,requestby,reqdate,status) values (?,?,?,?,?,?,?,?)");
	ps.setString(1, requestfor);
	ps.setString(2, requesttype);
	ps.setString(3, requestby);
	ps.setString(4, description);
	ps.setString(5, location);
	ps.setString(6, requestby);
	ps.setString(7, reqdate);
	ps.setString(8, status);

	int x = ps.executeUpdate();
	HttpSession httpsession;

	if (x > 0) {
		httpsession = request.getSession();
		//httpsession.setAttribute("reg-success", "Registration Successful...");
		response.sendRedirect("requests.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("requestsform.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>
