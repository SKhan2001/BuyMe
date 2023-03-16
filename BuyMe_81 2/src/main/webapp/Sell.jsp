<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> Alerts </title>
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
<body> <form method="post" action="SellUtility.jsp"> 
<div> <% 
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date = sdf.format(d);
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		int identity = (int) session.getAttribute("identity");
		session.setAttribute("identity", identity);
		out.println("<table>");
		out.println("<tr>");
		out.println("<td>"); 
			out.print("Please enter the Item Id you want to sell.");
			out.println("<input type=\"text\" name=\"itemid\";>");
		out.println("</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>"); 
			out.print("Initial price:");
			out.println("<input type=\"text\" name=\"initprice\";>");
		out.println("</td>");
		out.println("</tr>"); 
		out.println("<tr>");
		out.println("<td>"); 
			out.print("Minimum price:");
			out.println("<input type=\"text\" name=\"minprice\";>");
		out.println("</td>");
		out.println("</tr>"); 
		out.println("<tr>");
		out.println("<td>"); 
			out.print("Date posted:");
			out.println("<input type=\"text\" name=\"posteddate\";>");
		out.println("</td>");
		out.println("</tr>"); 
		out.println("<tr>");
		out.println("<td>"); 
			out.print("Closing time:");
			out.println("<input type=\"text\" name=\"closingtime\";>");
		out.println("</td>");
		out.println("</tr>"); 
		out.println("<tr>");
		out.println("<td>"); 
			out.print("Bid Increment:");
			out.println("<input type=\"text\" name=\"incr\";>");
		out.println("</td>");
		out.println("</tr>"); 
		%> 
			<input type="submit" value="Sell_Item"> 
		<% 
		out.println("</table>");
		
		
		
		db.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		%>

</div> </form>
</body>
</html>