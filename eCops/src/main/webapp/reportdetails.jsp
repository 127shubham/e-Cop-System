<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Report Details</title>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
		PreparedStatement stmt = con.prepareStatement("select * from complaints where cid=?");
		if (request.getParameter("cid") != null) {
			int cid = Integer.parseInt(request.getParameter("cid"));
			String subject, complainttype, complaintto, location, description, complaintby, phone, date, status, documents;
			stmt.setInt(1, cid);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
		cid = rs.getInt(1);
		subject = rs.getString(2);
		complainttype = rs.getString(3);
		complaintto = rs.getString(4);
		location = rs.getString(5);
		description = rs.getString(6);
		complaintby = rs.getString(7);
		phone = rs.getString(8);
		email = rs.getString(9);
		date = rs.getString(10);
		status = rs.getString(11);
		documents = rs.getString(12);
	%>
	<div class="container-fluid">
		<h1 class="mainheading mt-3 text-center">Report Details</h1>
	</div>
	<div class="container mb-5 col-md-8 col-sm-12 offset-md-2 border">
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint ID</p>
			</div>
			<div class="col">
				<p class="text-right"><%=cid%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint Subject (Complaint Title)</p>
			</div>
			<div class="col">
				<p class="text-right"><%=subject%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint Type</p>
			</div>
			<div class="col">
				<p class="text-right"><%=complainttype%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint To (The Police Station)</p>
			</div>
			<div class="col">
				<p class="text-right"><%=complaintto%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint Issued By</p>
			</div>
			<div class="col">
				<p class="text-right"><%=complaintby%></p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Complaint Date</p>
			</div>
			<div class="col">
				<p class="text-right"><%=date%></p>
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