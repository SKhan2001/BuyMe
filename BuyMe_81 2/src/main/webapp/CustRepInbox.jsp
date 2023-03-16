<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*" import="Servlets.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
<body>
<div>
	<% 
	List<String> inbox = new ArrayList<String>();
	List<Integer> users = new ArrayList<Integer>();
	String name = request.getParameter("name");
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		int identity = (int) session.getAttribute("identity");
		session.setAttribute("identity", identity);
		ResultSet al = stmt.executeQuery("select *, Question, Account_ID from Customer_Service where Cust_Rep_ID=" + identity + ";");
		int user = 0;
		while (al.next()) {
			inbox.add(al.getString("Question"));
			users.add(al.getInt("Account_ID"));
		}
		ListIterator<String> init = inbox.listIterator();
		ListIterator<Integer> uit = users.listIterator();
		out.println("<table>");
		out.println("<tr>");
		out.println("<td>");
	    	out.print("Messages"); 
	    out.println("</td>");
	    out.println("</tr>");
	    out.println("<tr>");
	    out.println("<td>");
	    out.print("___________________________________________________________________________________________________________"); 
	    out.println("</td>");
		 out.println("</tr>");
		 int u = 0;
		while (init.hasNext()) {
			 out.println("<tr>");
			 out.println("<td>"); 
			 u = uit.next();
			 	out.print(init.next() + "\tUSER ID : " + u); 
			 out.println("</td>");
			 out.println("</tr>");
			 out.println("<tr>");
			 out.println("<td>"); 
			%> <form method="post" action="CustRepReply.jsp"> <%
					out.println("<tr>");
			 		out.println("<td>"); 
			 			out.println("<input type=\"text\" name=\"Response\">");
			 		out.println("</td>");
		 			session.setAttribute("userid", u);
					out.println("</tr>");
				%> 
					<input type="submit" value="Send"> 
					</form> 
				<% 
				 out.println("</td>");
				 out.println("</tr>");
		} 
			out.println("</table>");
			stmt.close();
			al.close();
			db.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	%>
</div>
</body>
</html>