<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="regsForm.css"/>
</head>
<body>

<%
String invalidData = (String)request.getAttribute("INVALID DETAIL");
%>

<br><br><br>
<div class="regs">
  <p class="head">JOIN THE GAME</p>
  <form name="regsForm" method="post" action="registrationServlet">
    
    <label for="email">Email address</label><br>
    <input type="text" id="email" name="regs" required><br>
    
    <label for="username">Username</label>
    <label for="age">Age</label><br>
    <input type="text" id="username" name="regs" required>
    <input type="text" id="age" name="regs" required><br>
    
    <label for="password">Password</label><br>
    <input type="text" id="password" name="regs" required><br>
    
    <p class="invalid"><%if(invalidData != null){out.println(invalidData);} %></p><br>
    <input type="checkbox" id="terms" required>
    <label for="terms">I'm at least 13 years old and accept the terms of use </label>
    
    <p class="submit"><input type="submit" value="SIGN UP"></p>
    <p class="links">
      <i>Already have an account? <a href="login.jsp">Login here</a> or 
      <a href="theGame.jsp">Play as a guest</a></i>
    </p>
    </form>
</div>
<br><br><br>

</body>
</html>