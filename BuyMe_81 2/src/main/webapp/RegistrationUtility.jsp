<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<%
	int account_id = 0;
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");

	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		ResultSet rSet = stmt.executeQuery("select max(Account_ID) from Accounts;");
		if (rSet.next()) {
			account_id = rSet.getInt(1);
			response.sendRedirect("AccountCreation.jsp?name=" + name + "");
		}
		account_id++; 
		session.setAttribute("name", name);
		PreparedStatement ps = con.prepareStatement("insert into Accounts values (?, ?, ?, ?, FALSE, FALSE);");
		ps.setInt(1, account_id);
		ps.setString(2, name); 
		ps.setString(3, pass);
		ps.setString(4, email);
		ps.executeUpdate();
		ps.close();
		stmt.close();
		rSet.close();
		db.closeConnection(con);
	}  catch (Exception e) {
	}
%>
</body>
</html>