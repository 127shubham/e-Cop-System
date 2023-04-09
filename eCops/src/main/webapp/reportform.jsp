<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Submit Report</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid py-5">
		<h1 class="mainheading text-center text-light">Report Form</h1>
		<div class="container mt-5">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="card mb-5">
						<div class="card-header text-center text-white">
							<i class="fa fa-list-alt fa-3x" aria-hidden="true"></i>
							<h4>Submit Report</h4>
						</div>
						<div class="card-body">
							<%
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecops", "root", "1234");
								PreparedStatement stmt = con.prepareStatement("select * from complaints where cid=?");
								if (request.getParameter("cid") != null) {
									int cid = Integer.parseInt(request.getParameter("cid"));
									String subject, complainttype, complaintto, status;
									stmt.setInt(1, cid);
									ResultSet rs = stmt.executeQuery();

									while (rs.next()) {
								cid = rs.getInt(1);
								subject = rs.getString(2);
								complainttype = rs.getString(3);
								complaintto = rs.getString(4);
								status = rs.getString(5);
							%>
							<form method="post" action="status.jsp">
								<input type="hidden" name="cid" value="<%=cid%>">
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="subject">Subject</label> <input type="text"
												class="form-control" id="
											subject"
												aria-describedby="subjectHelp" placeholder="Enter Subject"
												name="subject" required="true" value="<%=subject%>" disabled>

										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<label for="complainttype">Complaint Type</label> <select
												class="custom-select" name="complainttype"
												id="complainttype" required="true"
												value="<%=complainttype%>" disabled>
												<option selected>Select Complaint Type</option>
												<option selected value="Missing Person">Missing
													Person</option>
												<option selected value="Theves">Theves</option>
												<option selected value="Murder">Murder</option>
												<option selected value="Attempt to murder">Attempt
													to murder</option>
												<option selected value="Roberry">Roberry</option>
												<option selected value="Kidnap">Kidnap</option>
												<option selected value="Other">Other</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<label for="complaintto">Police Department</label> <select
												class="custom-select" name="complaintto" id="complaintto"
												required="true" value="<%=complaintto%>" disabled>
												<option selected>Select Police Department</option>
												<option selected
													value="Rajapeth Police Station,
													Amt">Rajapeth
													Police Station, Amt</option>
												<option selected value="Achalpur Police Station">Achalpur
													Police Station</option>
												<option selected value="Anjangaon Police Station">Anjangaon
													Police Station</option>
											</select>
										</div>
									</div>
									<div class="col">
										<label for="reports">Upload Documents (jpeg, pdf)</label>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="customFile">
											<label class="custom-file-label" for="customFile">Choose
												file</label>
										</div>
									</div>
								</div>
								<button type="submit"
									class="btn btn-primary btn-block w-50 mx-auto mt-3">
									<i class="fa fa-check-square" aria-hidden="true"></i> Submit
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