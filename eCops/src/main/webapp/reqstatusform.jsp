<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Change Request Status</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid py-5">
		<h1 class="mainheading text-center text-light">Change Request
			Status</h1>
		<div class="container mt-5">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="card mb-5">
						<div class="card-header text-center text-white">
							<i class="fa fa-tasks fa-3x" aria-hidden="true"></i>
							<h4>Change Request Status</h4>
						</div>
						<div class="card-body">
							<%
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
								PreparedStatement stmt = con.prepareStatement("select * from requests where reqid=?");
								if (request.getParameter("reqid") != null) {
									int reqid = Integer.parseInt(request.getParameter("reqid"));
									String requestfor, status;
									stmt.setInt(1, reqid);
									ResultSet rs = stmt.executeQuery();

									while (rs.next()) {
								reqid = rs.getInt(1);
								requestfor = rs.getString(2);
								status = rs.getString(3);
							%>
							<form method="post" action="changereqstatus.jsp">
								<input type="hidden" name="reqid" value="<%=reqid%>">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="requestfor">Request For</label> <input
												type="text" class="form-control" id="requestfor"
												aria-describedby="subjectHelp"
												placeholder="Permission Request For" name="requestfor"
												required="true" value="<%=requestfor%>" readonly>
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="status">Change Complaint Status</label> <select
												class="custom-select" name="status" id="status"
												required="true" value="<%=status%>">
												<option selected>Change Status</option>
												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
													PreparedStatement st = conn.prepareStatement("select * from allstatus where type = 'request'");
													ResultSet rslt = st.executeQuery();

													while (rslt.next()) {
														status = rslt.getString("status");
												%>
												<option value="<%=status%>"><%=status%></option>
												<%
												}
												} catch (Exception e) {
												out.println(e.toString());
												}
												%>
											</select>
										</div>
									</div>
								</div>
								<button type="submit"
									class="btn btn-primary btn-block w-50 mx-auto mt-3">
									<i class="fa fa-check-square" aria-hidden="true"></i> Change
									Status
								</button>
							</form>
							<%
							}
							}
							} catch (Exception e) {
							out.println(e);
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>