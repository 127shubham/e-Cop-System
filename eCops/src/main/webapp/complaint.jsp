<%@ page language="java" import="java.sql.*"
	import="javax.servlet.http.HttpSession" import="java.io.*" %>
<%
	String subject = request.getParameter("subject");
	String complainttype = request.getParameter("complainttype");
	String complaintto = request.getParameter("complaintto");
	String description = request.getParameter("description");
	String location = request.getParameter("location");
	String complaintby = request.getParameter("complaintby");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String date = new java.util.Date().toLocaleString();
	String status = "Pending";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "root");
	
	if(description == null) {
		description = "";
	}

	PreparedStatement ps = conn.prepareStatement(
	"insert into complaints(subject,complainttype,complaintto,description,location,complaintby,phone,email,date,status) values (?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, subject);
	ps.setString(2, complainttype);
	ps.setString(3, complaintto);
	ps.setString(4, description);
	ps.setString(5, location);
	ps.setString(6, complaintby);
	ps.setString(7, phone);
	ps.setString(8, email);
	ps.setString(9, date);
	ps.setString(10, status);

	int x = ps.executeUpdate();
	HttpSession httpsession;

	if (x > 0) {
		httpsession = request.getSession();
		//httpsession.setAttribute("reg-success", "Registration Successful...");
		response.sendRedirect("complaints.jsp");
	} else {
		httpsession = request.getSession();
		httpsession.setAttribute("failedMsg", "Something went wrong on the server");
		response.sendRedirect("complaintform.jsp");
	}

} catch (Exception e) {
	out.println(e);
}
%>
