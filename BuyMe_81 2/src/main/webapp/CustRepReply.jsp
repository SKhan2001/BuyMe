<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Replying </title>
<style>
        h1 {color:black; font-family: "Courier New", Courier New, monospace; font-size: 25px;}
		h2 {color:green; font-size: 25px;}
		h3 {color:green; font-size: 25px;}
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
	<a href ="http://localhost:8080/BuyMe_81/Home.jsp">Home_Page</a> 
	<h1> Reply </h1>
	<h2> ChatBot. </h2>
	<h3>
		<%
		int alert_id = 0;
		try {

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rSet = stmt.executeQuery("select max(Alert_ID) from Alerts;");
			if (rSet.next()) {
				alert_id = rSet.getInt(1);
			}
			alert_id++;
			String reply = request.getParameter("Response");
			int userid = (int) session.getAttribute("userid");
			String insert = "INSERT INTO Alerts values (" + alert_id + ", " + userid + ", '" + reply + "', now());";
			
			PreparedStatement s = con.prepareStatement(insert);
			s.executeUpdate();
			out.print("Message Sent!");
			stmt.close();
			s.close();
			rSet.close();
			db.closeConnection(con);
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
		%>
	</h3>

</body>
</html>