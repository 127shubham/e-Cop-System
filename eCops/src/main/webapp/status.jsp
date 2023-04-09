<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Complaint Status</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<%
	if (email != null) {
	%>
	<div class="container-fluid">
		<h1 class="mainheading m-3 text-center">Complaint Status</h1>
	</div>

	<div class="table-responsive-sm mx-5 table-hover">
		<table class="table  table-bordered" id="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Subject</th>
					<th scope="col">Type</th>
					<th scope="col">Complaint To</th>
					<th scope="col">Complaint By</th>
					<th scope="col">Complaint Date</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
					PreparedStatement stmt = con.prepareStatement("select * from complaints");

					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
				%>
				<tr>
					<th scope="row">
						<%
						out.println(rs.getString("cid"));
						%>
					</th>
					<td><a href="statusdetails.jsp?cid=<%=rs.getString("cid")%>">
							<%
							out.println(rs.getString("subject"));
							%>
					</a></td>
					<td>
						<%
						out.println(rs.getString("complainttype"));
						%>
					</td>
					<td>
						<%
						out.println(rs.getString("complaintto"));
						%>
					</td>
					<td>
						<%
						out.println(rs.getString("complaintby"));
						%>
					</td>
					<td>
						<%
						out.println(rs.getString("date"));
						%>
					</td>
					<td style="color: orange">
						<%
						out.println(rs.getString("status"));
						%>

					</td>
					<%
					if (rs.getString("status") == "Completed") {
					%>
					<td>
						<div class="d-flex flex-direction-row">
							<a href="reportform.jsp?cid=<%=rs.getString("cid")%>"
								class="btn btn-warning"> <i class="fa fa-exchange"
								aria-hidden="true"> </i> Submit Report
							</a>
						</div>
					</td>
					<%
					} else {
					%>
					<td>
						<div class="d-flex flex-direction-row">
							<a href="changestatusform.jsp?cid=<%=rs.getString("cid")%>"
								class="btn btn-warning"> <i class="fa fa-exchange"
								aria-hidden="true"> </i> Change Status
							</a>
						</div>
					</td>
					<%
					}
					%>
				</tr>
				<%
				}
				} catch (Exception e) {
				out.println(e.toString());
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	} else {
	response.sendRedirect("loginform.jsp");
	}
	%>
</body>
</html>