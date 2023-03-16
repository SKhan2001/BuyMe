<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> BuyMe--Home </title>
<style>
    body {
    	background-color: hsl(240, 100%, 90%);
    	
    }
    div {
    	word-spacing: 50px;
    	margin-top: 3;
    }
    a {
  		position: relative;
  		top: 300px;
  		left: 100px;
  		font-size: 30px;
	}
	a:link, a:visited {
  		background-color: white;
  		color: black;
  		border: 5px solid hsl(330, 100%, 20%);
  		padding: 40px 60px;
  		text-align: center;
  		align: bottom;
  		text-decoration: none;
  		display: inline-block;
	}
	a:hover, a:active {
  		background-color: hsl(120, 100%, 10%);
  		color: white;
	} 
</style>
</head>
<body>
	<div>
		<a href ="http://localhost:8080/BuyMe_81/Home.jsp"> Home </a>

		<a href ="http://localhost:8080/BuyMe_81/Login.jsp"> Login </a>
		
		<a href ="http://localhost:8080/BuyMe_81/AdminLogin.jsp"> Admin_Login </a>
		
		<a href ="http://localhost:8080/BuyMe_81/CRepLogin.jsp"> Customer_Rep_Login </a>
		
		<a href ="http://localhost:8080/BuyMe_81/Register.jsp"> SignUp </a>
		
		<a href ="http://localhost:8080/BuyMe_81/Logout.jsp"> Logout </a>
	</div>
</body>
</html> 