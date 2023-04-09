<%@page import="com.eCops.Dao.LoginDao"%>
<jsp:useBean id="userModel" class="com.eCops.Model.UserModel" scope="session" />
<jsp:setProperty name="userModel" property="*" />

<%
String user = LoginDao.loginCheck(userModel);
if (user.equals("true")) {
	session.setAttribute("email", userModel.getEmail());
	response.sendRedirect("index.jsp");
}

if (user.equals("false")) {
	response.sendRedirect("index.jsp?status=false");
}

if (user.equals("error")) {
	response.sendRedirect("index.jsp?status=error");
}
%>