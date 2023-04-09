<%@ page language="java" import="java.sql.*"
	import="javax.servlet.http.HttpSession" import="java.io.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Contact Us</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid py-5">
		<h1 class="mainheading text-center text-light">Contact Us</h1>
		<div class="container mt-5">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="card mb-5">
						<div class="card-header text-center text-white">
							<i class="fa fa-tasks fa-3x" aria-hidden="true"></i>
							<h4>Contact Us</h4>
						</div>
						<%
						String msgSent = (String) session.getAttribute("msg-sent");

						if (msgSent != null) {
						%>
						<div class="alert alert-success" role="alert"><%=msgSent%>
							Thank you for contact us
						</div>
						<%
						session.removeAttribute("msg-sent");
						}
						%> 
						<div class="card-body">
							<form method="post" action="contact.jsp">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" aria-describedby="NameHelp"
										placeholder="Enter Name" name="name" required="true">
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" aria-describedby="EmailHelp"
										placeholder="Enter Email" name="email" required="true">
								</div>
								<div class="form-group">
									<label for="name">Contact Number</label> <input type="number"
										class="form-control" id="phone" aria-describedby="PhoneHelp"
										placeholder="Enter Phone Number" name="phone"
										required="true">
								</div>
								<div class="form-group">
									<label for="message">Message</label>
									<textarea class="form-control" id="message" rows="3"
										require="true" name="message"></textarea>
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