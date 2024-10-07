<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="login.css"/>
<style>
	.login input[type="password"]{
	background-color: #abc;
	padding: 5px;
	margin-bottom: 15px;
	height: 27.5px;
	border: none;
	border-radius: 5px;
}

.login input[type="password"]:focus{
	outline: 0;
	box-shadow: 0px 0px 3px 0.5px #14181c;
	background-color: #fff;
	border: none;
}
</style>
</head>
<body>
<%
	String invalid = (String)request.getAttribute("VALIDITY");
%>
	<br>
	<br>
	<br>
	<div class="login">
		<p class="head">LOG IN</p>
		<form name="loginForm" method="post" action="loginServlet">

			<label for="username">Username/Email</label> 
			<input type="text" id="username" name="login" required> 
			<label for="password">Password</label><br> 
			<input type="password" id="password" name="login" required><br>
			
			<p class="invalid"><% if (invalid != null){out.println(invalid);} %></p><br>
			
			<p class="submit"><input type="submit" value="LOG IN"></p>
			<p class="links">
				<i>Don't have an account? <a href="regsForm.jsp">Register here</a> or 
				<a href="theGame.jsp">Play as a guest</a></i>
			</p>
	</div>
	<br>
	<br>
	<br>

</body>
</html>