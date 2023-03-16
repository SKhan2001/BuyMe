<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*" import="Servlets.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> Item_Search </title>
	<style>
		div {
			position: relative;
  			top: 60px;
  			left: 60px
		}
		body {
			background-color: cornsilk;
			font-size: 25px;
			font-family: 'Garamond', Garamond, serif;
		}
	</style>
</head>
<body>
<div>
	
<form method="get" action="Results.jsp">
	<select name="Operating_System" size=1>
		<option value="1">Windows</option>
		<option value="2">Linux</option>
		<option value="3">MacOS</option>
</select>&nbsp;<br> <input type="submit" value="submit">
	
</form>
</div>
</body>
</html>