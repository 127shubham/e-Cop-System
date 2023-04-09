<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/cdn.jsp"%>
<title>Insert title here</title>
<script src="js/loginValidation.js"></script>
</head>
<body>
<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid py-5">
		<h1 class="mainheading mt-3 mb-5 text-center text-light">Login
			Form</h1>
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center text-white">
						<i class="fa fa-sign-in fa-3x" aria-hidden="true"></i>
						<h4>Log In</h4>
					</div>
					<%
					email = (String) session.getAttribute("email");

					//redirect user to home page if already logged in
					if (email != null) {
						response.sendRedirect("index.jsp");
					}

					String status = request.getParameter("status");

					if (status != null) {
						if (status.equals("false")) {
							out.print("Incorrect login details!");
						} else {
							out.print("Some error occurred!");
						}
					}
					%>
					<%
					String loginfailed = (String) session.getAttribute("loginfailed");

					if (loginfailed != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=loginfailed%></div>
					<%
					session.removeAttribute("loginfailed");
					}
					%>

					<div class="card-body">
						<form method="post" action="loginRequestHandler.jsp">
							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" aria-describedby="emailHelp"
									placeholder="Enter Email" name="email" required="true">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" placeholder="Enter Password"
									name="password" required="true">
							</div>
							<button type="submit"
								class="btn btn-success btn-block w-50 mx-auto mt-3">
								<i class="fa fa-sign-in" aria-hidden="true"></i> Log In
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>