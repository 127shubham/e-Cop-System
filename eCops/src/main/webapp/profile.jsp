<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_cdn.jsp"%>
<title>Profile</title>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<h1 class="mainheading mt-3 text-center">Profile</h1>
	</div>
	<div class="container p-5 col-md-8 col-sm-12 offset-md-2 border">
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Name</p>
			</div>
			<div class="col">
				<p class="text-right">Pravin Tidake</p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Email</p>
			</div>
			<div class="col">
				<p class="text-right">pravintidake@mail.com</p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Phone</p>
			</div>
			<div class="col">
				<p class="text-right">7874747474</p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Address</p>
			</div>
			<div class="col">
				<p class="text-right">Amravati</p>
			</div>
		</div>
		<div class="row m-3 border-bottom">
			<div class="col">
				<p class="font-weight-bold">Role</p>
			</div>
			<div class="col">
				<p class="text-right">User</p>
			</div>
		</div>
	</div>
</body>
</html>