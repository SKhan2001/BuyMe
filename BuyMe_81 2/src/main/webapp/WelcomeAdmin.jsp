<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Welcome Screen </title>
<style>
		div {
			position: left;
  			top: 20px;
  			left: 60px
		}
        h1 {color:hsl(0, 100%, 45%); font-family: "Courier New", Courier New, monospace; font-size: 45px;}
		h2 {color:green; font-family: "Times New Roman", Times, serif; font-size: 25px;}
		h3 {color:green; font-family: "Times New Roman", Times, serif; font-size: 25px;}
		 a {
  			position: relative;
  			top: 10px;
  			left: 920px;
  			font-size: 30px;
		}
		a:link, a:visited {
  			background-color: white;
  			color: black;
  			border: 5px solid hsl(330, 100%, 20%);
  			padding: 20px 35px;
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
	<a href ="http://localhost:8080/BuyMe_81/AccountDeletion.jsp">Delete_Account</a>
	<a href ="http://localhost:8080/BuyMe_81/Logout.jsp">Logout</a> 
	<div>
		<form method="get" action="AdminToolkit.jsp">
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
			    <input type ="submit" style = "font-size: 30px; font-family: 'Garamond', Garamond, serif" name ="Customer_Rep">
		</form>
	</div>
	<h1> BuyMe </h1>
	<h2> You have logged in successfully. </h2>
	<h3>
		<%
			out.println("Welcome, admin " + request.getParameter("name") + ".");
			out.println("Your tools include creating a new customer representative account. \nJust fill out the fields above and hit submit!");
			try {
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				Statement stmt = con.createStatement();
				int identity = Integer.parseInt(request.getParameter("identity"));
				session.setAttribute("identity", identity); 
				stmt.close();
				db.closeConnection(con); 
			}  catch (Exception e) {
			} 
		%>
	</h3>

</body>
</html>