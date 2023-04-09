<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>All Permission Requests</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<%
	if (email != null) {
	%>
	<div class="container-fluid">
		<h1 class="mainheading mt-3 text-center">Permission Requests</h1>
	</div>

	<div class="row mx-5">
		<div class="col-md-12 text-right mb-3">

			<a href="requestsform.jsp" class="btn btn-primary"> <i
				class="fa fa-plus" aria-hidden="true"></i> Apply for Permission
			</a>
		</div>
	</div>

	<div class="table-responsive-sm mx-5 table-hover">
		<table class="table  table-bordered" id="table">
			<thead>
				<tr>
					<th scope="col">Req ID</th>
					<th scope="col">Permission For</th>
					<th scope="col">Request Type</th>
					<th scope="col">Requested To</th>
					<th scope="col">Requested By</th>
					<th scope="col">Request Date</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>


				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
					PreparedStatement stmt = con.prepareStatement("select * from requests");
					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
				%>
				<tr>
					<th scope="row">
						<%
						out.println(rs.getString("reqid"));
						%>
					</th>
					<td><a
						href="requestdetail.jsp?reqid=<%=rs.getString("reqid")%>"> <%
 out.println(rs.getString("requestfor"));
 %>
					</a></td>
					<td>
						<%
						out.println(rs.getString("requesttype"));
						%>
					</td>
					<td>
						<%
						out.println(rs.getString("requestto"));
						%>
					</td>
					<td>
						<%
						out.println(rs.getString("requestby"));
						%>
					</td>
					<td>
						<%
						out.println(rs.getString("reqdate"));
						%>
					</td>
					<td style="color: orange">
						<%
						out.println(rs.getString("status"));
						%>

					</td>
					<td>
						<div class="d-flex flex-direction-row">
							<a href="reqstatusform.jsp?reqid=<%=rs.getString("reqid")%>"
								class="btn btn-warning"> <i class="fa fa-exchange"
								aria-hidden="true"> </i> Change Status
							</a>
						</div>
					</td>
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