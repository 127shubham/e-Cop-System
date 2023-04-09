<nav class="navbar navbar-expand-lg navbar-light">
	<a class="navbar-brand text-light" href="index.jsp">E-Cops</a>
	<button class="navbar-toggler bg-light" type="button"
		data-toggle="collapse" data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link text-light"
				href="index.jsp"> <i class="fa fa-home" aria-hidden="true"></i>
					Home <span class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="complaints.jsp"> <i class="fa fa-linode"
					aria-hidden="true"></i> Complaints
			</a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="status.jsp"> <i class="fa fa-hourglass" aria-hidden="true"></i>
					Status
			</a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="reports.jsp"> <i class="fa fa-book" aria-hidden="true"></i>
					Reports
			</a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="requests.jsp"> <i class="fa fa-hand-paper-o"
					aria-hidden="true"></i> Requests
			</a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="about.jsp"> <i class="fa fa-address-card"
					aria-hidden="true"></i> About Us
			</a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="contactform.jsp"> <i class="fa fa-phone" aria-hidden="true"></i>
					Contact Us
			</a></li>
		</ul>

		<%
		String email=(String)session.getAttribute("email");
		if (email != null) {
		%>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link text-light"
				href="profile.jsp"> <i
					class="fa fa-user-circle" aria-hidden="true"></i> <%=email%>
			</a></li>
			<li class="nav-item"><a class="nav-link bg-light text-dark"
				href="logout.jsp"><i class="fa fa-user-plus"
					aria-hidden="true"></i> Logout</a></li>
		</ul>
		<%
		} else {
		%>

		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link bg-light"
				href="loginform.jsp"> <i class="fa fa-sign-in"
					aria-hidden="true"></i> Login
			</a></li>
			<li class="nav-item"><a class="nav-link bg-light text-dark"
				href="registerform.jsp"><i class="fa fa-user-plus"
					aria-hidden="true"></i> Register</a></li>
		</ul>
		<%
		}
		%>
	</div>
</nav>