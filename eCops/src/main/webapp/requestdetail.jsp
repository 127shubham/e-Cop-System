<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Request Details</title>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
		PreparedStatement stmt = con.prepareStatement("select * from requests where reqid=?");
		if (request.getParameter("reqid") != null) {
			int reqid = Integer.parseInt(request.getParameter("reqid"));
			String requestfor, requesttype, requestto, location, description, requestby, reqdate, status;
			stmt.setInt(1, reqid);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				reqid = rs.getInt(1);
				requestfor = rs.getString(2);
				requesttype = rs.getString(3);
				requestto = rs.getString(4);
		location = rs.getString(5);
		description = rs.getString(6);
		requestby = rs.getString(7);
		reqdate = rs.getString(8);
		status = rs.getString(9);
	%>
	<div class="container-fluid">
		<h1 class="mainheading mt-3 text-center">Request Details</h1>
	</div>
	<div class="container mb-5 col-md-8 col-sm-12 offset-md-2 border">
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Request ID</p>
			</div>
			<div class="col">
				<p class="text-right"><%=reqid%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Permission Request For</p>
			</div>
			<div class="col">
				<p class="text-right"><%=requestfor%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Request Type</p>
			</div>
			<div class="col">
				<p class="text-right"><%=requesttype%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint To (The Police Station)</p>
			</div>
			<div class="col">
				<p class="text-right"><%=requestto%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Requested By</p>
			</div>
			<div class="col">
				<p class="text-right"><%=requestby%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Request Date</p>
			</div>
			<div class="col">
				<p class="text-right"><%=reqdate%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Status</p>
			</div>
			<div class="col">
				<p class="text-right text-warning"><%=status%></p>
			</div>
		</div>
	</div>
	<%
	}
	}
	} catch (Exception e) {
	out.println(e);
	}
	%>
</body>
</html>