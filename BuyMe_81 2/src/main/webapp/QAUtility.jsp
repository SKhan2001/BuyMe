<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Customer Service </title>
<style>
		body {
			position: relative;
  			top: 60px;
  			left: 60px;
			background-color: lightgreen;
			word-spacing: 30px;
			font-size: 35px;
			font-family: 'Garamond', Garamond, serif;
		}
	</style>
</head>
<body>
<form method="post" action="AccountDeletion.jsp">
<% 	
	try {
		int accid = (int) session.getAttribute("identity");
		String query = request.getParameter("Quest");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		PreparedStatement ps = con.prepareStatement("insert into customer_service values (?, ?, ?);");
		ps.setInt(1, 2);
		ps.setInt(2, accid);
		ps.setString(3, query);
		ps.executeUpdate();
		out.print("Question Sent!\t");
		 out.print("A customer service representative will be with you shortly.");
		ps.close();
		stmt.close();
		db.closeConnection(con);
    } catch (Exception e) {
    	e.printStackTrace();
	}
%>
</form>
</body>
</html>