<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> </title>
</head>
<body>
<form method="post" action="AccountDeletion.jsp">
<% 	
	try {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		ResultSet id = stmt.executeQuery("select Account_ID from Accounts where Username = '" + name + "' and Password = '" + pass + "';");
		int identity = 0;
		if (id.next()) 
			identity = id.getInt(1);
		out.println(identity);
		session.setAttribute("identity", identity);
		ResultSet rs = stmt.executeQuery("select Username, Password from Accounts where Username = '" + name + "'and Password = '" + pass + "' and isAdmin is false and isCustomerRep is true");
		session.setAttribute("name", name);
		session.setAttribute("pass", pass);
		if (rs.next()) {
				response.sendRedirect("WelcomeCRep.jsp?name=" + name + "");
		} else {
			out.println("\n\tInvalid Username or Password");
		}
		stmt.close();
		rs.close();
		db.closeConnection(con);
    } catch (Exception e) {
    	e.printStackTrace();
	}
%>
</form>
</body>
</html>