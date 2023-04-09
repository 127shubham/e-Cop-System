<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>New Request</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid py-5">
		<h1 class="mainheading text-center text-light">Permission Request
			Form</h1>
		<div class="container mt-5">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="card mb-5">
						<div class="card-header text-center text-white">
							<i class="fa fa-tasks fa-3x" aria-hidden="true"></i>
							<h4>Permission Request</h4>
						</div>
						<div class="card-body">
							<form method="post" action="request.jsp">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="subject">Permission for</label> <input
												type="text" class="form-control" id="
											subject"
												aria-describedby="subjectHelp"
												placeholder="Permission Request For" name="requestfor"
												required="true">
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="complainttype">Request Type</label> <select
												class="custom-select" name="requesttype" id="requesttype"
												required="true">
												<option selected>Select Request Type</option>
												
												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
													PreparedStatement stmt = con.prepareStatement("select * from request_type");
													ResultSet rs = stmt.executeQuery();

													while (rs.next()) {
														String requesttype = rs.getString("requesttype");
												%>
												<option value="<%=requesttype%>"><%=requesttype%></option>
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
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="complaintto">Request To</label> <select
												class="custom-select" name="requestto" id="requestto"
												required="true">
												<option selected>Select Police Department</option>

												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
													PreparedStatement stmt = con.prepareStatement("select * from user where role = 'Police Department'");
													ResultSet rs = stmt.executeQuery();

													while (rs.next()) {
														String complaintto = rs.getString("name");
												%>
												<option value="<%=complaintto%>"><%=complaintto%></option>
												<%
												}
												} catch (Exception e) {
												out.println(e.toString());
												}
												%>

												<!-- <option value="Rajapeth Police Station, Amt">Rajapeth
													Police Station, Amt</option>
												<option value="Achalpur Police Station">Achalpur
													Police Station</option>
												<option value="Anjangaon Police Station">Anjangaon
													Police Station</option> -->
											</select>
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="subject">Location</label> <input type="text"
												class="form-control" id="location"
												aria-describedby="subjectHelp" placeholder="Enter Location"
												name="location" required="true">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="exampleFormControlTextarea1">Description</label>
									<textarea class="form-control" id="description" rows="3"
										require="true" name="description"></textarea>
								</div>
								<button type="submit"
									class="btn btn-primary btn-block w-50 mx-auto mt-3">
									<i class="fa fa-check-square" aria-hidden="true"></i> Submit
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>