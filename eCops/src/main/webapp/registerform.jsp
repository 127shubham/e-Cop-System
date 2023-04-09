<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.lang.*"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Register</title>
</head>
<body>
	<%-- <%@include file="all_components/navbar.jsp"%>
	<script>
		function validate() {
			var name = document.form.name.value;
			var email = document.form.email.value;
			var role = document.form.role.value;
			var phone = document.form.phone.value;
			var address = document.form.address.value;
			var password = document.form.password.value;
			var cpassword = document.form.cpassword.value;

			
			 if (password != cpassword) {
				alert("Confirm Password should match with the Password");
				return false;
			} 
		}
	</script> --%>
	<div class="container-fluid py-5">
		<h1 class="mainheading mb-5 text-center text-light">Registration
			Form</h1>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center text-white">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>

					<%-- <%
					String regMsg = (String) session.getAttribute("reg-success");

					if (regMsg != null) {
					%> --%>
					<div class="alert alert-success" role="alert"><%-- <%=regMsg%> --%>
						Login <a href="loginform.jsp"> Click Here</a>
					</div>
					<%-- <%
					session.removeAttribute("reg-success");
					}
					%>

					<%
					String failedMsg = (String) session.getAttribute("failedMsg");

					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg%></div>
					<%
					session.removeAttribute("failedMsg");
					}
					%> --%>
					<div class="card-body">
						<form name="form" action="register.jsp" method="post" id="regForm"
							onsubmit="return validate()">
							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											class="form-control" id="name" aria-describedby="nameHelp"
											placeholder="Enter Full Name" name="name" required="true">
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="email">Email address</label> <input type="email"
											class="form-control" id="email" aria-describedby="emailHelp"
											placeholder="Enter Email" name="email" required="true">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="role">Role</label> <select class="custom-select"
											name="role" id="role" required="true">
											<option selected>Select Role</option>
											<option value="User">User</option>
											<option value="Admin">Admin</option>
											<option value="Police Department">Police Department</option>
										</select>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="phone">Phone</label> <input type="number"
											class="form-control" id="phone" aria-describedby="phoneHelp"
											placeholder="Enter Phone Number" name="phone" required="true">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="address">Address</label> <input type="textarea"
									class="form-control" id="address"
									aria-describedby="addressHelp" placeholder="Enter Address"
									name="address" required="true">
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											class="form-control" id="password"
											placeholder="Enter Password" name="password" required="true">
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="cpassword">Confirm Password</label> <input
											type="password" class="form-control" id="cpassword"
											placeholder="Confirm Password" name="cpassword"
											required="true">
									</div>
								</div>
							</div>
							<%-- <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%> --%>
							<button type="submit"
								class="btn btn-primary btn-block w-50 mx-auto mt-3">
								<i class="fa fa-user-plus" aria-hidden="true"></i> Register
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>