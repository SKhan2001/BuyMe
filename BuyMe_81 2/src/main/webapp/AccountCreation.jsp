<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> SignUp Screen </title>
<style>
        h1 {color:hsl(0, 100%, 45%); font-family: "Courier New", Courier New, monospace; font-size: 45px;}
		h2 {color:green; font-family: "Times New Roman", Times, serif; font-size: 25px;}
		h3 {color:green; font-family: "Times New Roman", Times, serif; font-size: 25px;}
		 a {
  			position: relative;
  			top: 10px;
  			left: 1150px;
  			font-size: 30px;
		}
		a:link, a:visited {
  			background-color: white;
  			color: black;
  			border: 5px solid hsl(330, 100%, 20%);
  			padding: 30px 50px;
  			text-align: center;
  			align: center;
  			text-decoration: none;
  			display: inline-block;
		}

		a:hover, a:active {
  			background-color: hsl(120, 100%, 10%);
  			color: white;
		}
		body {
			/*background-color: hsl(90, 100%, 80%);*/
			background-color: white;
			word-spacing: 30px;
			font-size: 30px;
		}
</style>
</head>
<body>

<a href ="http://localhost:8080/BuyMe_81/Logout.jsp">Logout</a> 
<h1> BuyMe </h1>
<h2>
	<%
		out.println("Welcome to BuyMe, " + request.getParameter("name") + ".");
	%>
</h2>
<h3> Your account has been created successfully. </h3>

</body>
</html>