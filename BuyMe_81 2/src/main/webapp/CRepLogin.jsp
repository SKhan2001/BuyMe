<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> Login </title>
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
		.p3 {
		    text-indent: 4em;
		    margin-top: 30px;
		}
	</style>
</head>
<body>
<form method="get" action="CRepLoginCredentials.jsp">
<div>
	<p class="p1">
		UserName : 	<input type="text"  style = "font-size: 25px; margin-top: 30px; line-height: 30px" name ="name"> 
	</p>
	<p class="p2">
		Password :  <input type="password" style = "font-size: 25px; margin-top: 30px; line-height: 30px" name ="pass">
	</p>
	<p class="p3">
	    <input type ="submit" style = "font-size: 30px; font-family: 'Garamond', Garamond, serif" name ="Submit">
	</p>
</div>
</form>
</body>
</html>