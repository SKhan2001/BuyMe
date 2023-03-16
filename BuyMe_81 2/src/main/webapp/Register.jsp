<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> Registration-New User </title>
	<style>
		div {
			position: relative;
  			top: 260px;
  			left: 360px
		}
		body {
			background-color: lightblue;;
			word-spacing: 30px;
			font-size: 35px;
			font-family: 'Garamond', Garamond, serif;
		}
	</style>
</head>
<body>
<div>
<form method="get" action="RegistrationUtility.jsp">
	<p class="p1">
		UserName : 	<input type="text"  style = "font-size: 25px; margin-top: 30px; line-height: 30px" name ="name"> 
	</p>
	<p class="p2">
		Password :  <input type="password" style = "font-size: 25px; margin-top: 30px; line-height: 30px" name ="pass">
	</p>
	<p class="p3">
	    Email : <input type ="text" style = "font-size: 30px; font-family: 'Garamond', Garamond, serif" name ="email">
	</p>
	<p class="p4">
	    <input type ="submit" style = "font-size: 30px; font-family: 'Garamond', Garamond, serif" name ="Sign Up">
	</p>
</form>
</div>
</body>
</html>