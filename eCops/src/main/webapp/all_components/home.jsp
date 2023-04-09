<div class="homediv col-10 col-sm-10 col-lg-10">
	<h1 class="mainheading mb-5 text-center">E-Cops Your Online
		Complaint App</h1>
	<div class="herodiv">
		<img class="homeImg" src="https://wallpapercave.com/wp/wp7034613.jpg"
			alt="homeimg">
		<h3 class="text-center">Taking stock of your security round the
			clock! Dial 100 in case of any emergency. Help us to help you.</h3>
		<%
		if (email != null) {
		%>
		<a href="complaintform.jsp" class="btn complaintbtn mt-5"><i
			class="fa fa-linode" aria-hidden="true"></i> Issue Complaint</a>
		<%
		} else {
		%>
		<a href="loginform.jsp" class="btn complaintbtn mt-5"><i
			class="fa fa-linode" aria-hidden="true"></i> Go To Login</a>
		<%
		}
		%>
	</div>
</div>