<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display_Items</title>
</head>
<body>
	<%
		List<String> items = new ArrayList<String>();
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String entity = request.getParameter("Operating_System");
			String str = "";
			if (entity.equals("1"))
				 str = "SELECT Windows_Description FROM item WHERE Is_Linux is false and Is_Mac is not true";
			else if (entity.equals("2"))
				str = "SELECT Linux_Description FROM item WHERE Is_Linux is true and Is_Mac is false";
			else 
				str = "SELECT MacOS_Description FROM item WHERE Is_Linux is not true and Is_Mac is true";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");
			while (result.next()) {
			//make a row
				out.print("<tr>");
			//make a column
				out.print("<td>");
			//print out column header
					out.print("|****  " + result.getString(1));
				out.print("</td>");
				out.print("</tr>");
			
			}
			out.print("</table>");

			con.close();

		} catch (SQLException e) {
		}
	%>

</body>
</html>