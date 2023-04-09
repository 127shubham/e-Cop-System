<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Update Complaint</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid py-5">
		<h1 class="mainheading text-center text-light">Update Complaint
			Form</h1>
		<div class="container mt-5">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="card mb-5">
						<div class="card-header text-center text-white">
							<i class="fa fa-tasks fa-3x" aria-hidden="true"></i>
							<h4>Update Complaint</h4>
						</div>
						<div class="card-body">

							<%
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
								PreparedStatement stmt = con.prepareStatement("select * from complaints where cid=?");
								if (request.getParameter("cid") != null) {
									int cid = Integer.parseInt(request.getParameter("cid"));
									String subject, complainttype, complaintto, description, location;
									stmt.setInt(1, cid);
									ResultSet rs = stmt.executeQuery();

									while (rs.next()) {
								cid = rs.getInt(1);
								subject = rs.getString(2);
								complainttype = rs.getString(3);
								complaintto = rs.getString(4);
								location = rs.getString(5);
								description = rs.getString(6);
							%>
							<form method="post" action="updatecomplaint.jsp">
								<input type="hidden" name="cid" value="<%=cid%>">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="subject">Subject</label> <input type="text"
												class="form-control" id="
											subject"
												aria-describedby="subjectHelp" placeholder="Enter Subject"
												name="subject" required="true" value="<%=subject%>">

										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="role">Complaint Type</label> <select
												class="custom-select" name="complainttype"
												id="complainttype" required="true"
												value="<%=complainttype%>">
												<option selected>Select Complaint Type</option>
												
												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
													PreparedStatement st = conn.prepareStatement("select * from complaint_type");
													ResultSet rlts = st.executeQuery();

													while (rlts.next()) {
														complainttype = rlts.getString("complainttype");
												%>
												<option value="<%=complainttype%>"><%=complainttype%></option>
												<%
												}
												} catch (Exception e) {
												out.println(e.toString());
												}
												%>
											</select>
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="role">Police Department</label> <select
												class="custom-select" name="complaintto" id="complaintto"
												required="true" value="<%=complaintto%>">
												<option selected>Select Police Department</option>
												
												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
													PreparedStatement st = conn.prepareStatement("select * from user where role = 'Police Department'");
													ResultSet rlts = st.executeQuery();

													while (rlts.next()) {
														complaintto = rlts.getString("name");
												%>
												<option value="<%=complaintto%>"><%=complaintto%></option>
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

								<div class="form-group">
									<label for="exampleFormControlTextarea1">Description</label>
									<textarea class="form-control" id="description" rows="3"
										name="description" require="true"><%=description%></textarea>
								</div>

								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="subject">Location</label> <input type="text"
												class="form-control" id="location"
												aria-describedby="subjectHelp" placeholder="Enter Location"
												name="location" required="true" value="<%=location%>">
										</div>
									</div>
									<div class="col">
										<label for="subject">Upload Documents (jpeg, pdf)</label>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="customFile">
											<label class="custom-file-label" for="customFile">Choose
												file</label>
										</div>
									</div>
								</div>
								<button type="submit"
									class="btn btn-primary btn-block w-50 mx-auto mt-3">
									<i class="fa fa-check-square" aria-hidden="true"></i> Update
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
	<script>
		// Add the following code if you want the name of the file appear on select
		$(".custom-file-input").on(
				"change",
				function() {
					var fileName = $(this).val().split("\\").pop();
					$(this).siblings(".custom-file-label").addClass("selected")
							.html(fileName);
				});
	</script>
</body>
</html>