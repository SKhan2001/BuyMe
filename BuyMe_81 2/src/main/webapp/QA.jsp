<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> QA </title>
	<style>
		body {
			position: relative;
  			top: 60px;
  			left: 60px;
			background-color: cornsilk;
			word-spacing: 30px;
			font-size: 35px;
			font-family: 'Garamond', Garamond, serif;
		}
	</style>
</head>
<body>	<% 
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		int identity = (int) session.getAttribute("identity");
		session.setAttribute("identity", identity); 
		out.println("Account ID = " + identity); %>
	<form method="post" action="QAUtility.jsp"> <%
			out.print("Please enter your query.");
				out.println("<table>");
					out.println("<tr>");
					out.println("<td>"); 
		 			out.println("<input type=\"text\" name=\"Quest\" style=\"padding: 40px 60px\";>");
		 			out.println("</td>");
					out.println("</tr>");
				out.println("</table>");
	%>
			<input type="submit" value="Send"> 
			</form> 
	<% 		stmt.close();
			db.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	%>
</body>
</html>