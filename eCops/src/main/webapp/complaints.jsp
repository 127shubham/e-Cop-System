<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>

<title>All Complaints</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<%
	if (email != null) {
	%>
	<div class="container-fluid">
		<h1 class="mainheading mt-3 text-center">Complaints</h1>
	</div>

	<div class="row mx-5">
		<div class="col-md-12 text-right mb-3">

			<a href="complaintform.jsp" class="btn btn-primary"> <i
				class="fa fa-plus" aria-hidden="true"></i> New Complaint
			</a>
		</div>
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
					<td><a href="complaintdetail.jsp?cid=<%=rs.getString("cid")%>">
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
					<td>
						<div class="d-flex flex-direction-row">
							<a href="updatecomplaintform.jsp?cid=<%=rs.getString("cid")%>"
								class="btn btn-success"> <i class="fa fa-pencil"
								aria-hidden="true"></i>
							</a> &nbsp; <a
								href="deletecomplaint.jsp?cid=<%=rs.getString("cid")%>"
								class="btn btn-danger"> <i class="fa fa-trash"
								aria-hidden="true"></i>
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
	} else { response.sendRedirect("loginform.jsp");
	}
	%>
</body>
</html>