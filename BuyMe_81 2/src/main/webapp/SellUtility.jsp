<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Bidding </title>
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
	<h1> Buy </h1>
	<h2> Bid_Util </h2>
	<h3>
		<%
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(d);
		try {

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			int userid = (int) session.getAttribute("identity");
			int itemid = Integer.parseInt(request.getParameter("itemid"));
			int initprice = Integer.parseInt(request.getParameter("initprice"));
			int minprice = Integer.parseInt(request.getParameter("minprice"));
			String post = (String) request.getParameter("posteddate");
			String close = (String) request.getParameter("closingtime");
			int incr = Integer.parseInt(request.getParameter("incr"));
			ResultSet rSet;
			
			String insert = "insert into post_for_sale values (" + userid + ", " + itemid + ", " + initprice + ", " + minprice + ", \'" + post + "\', \'" + close + "\', " + incr + ");";
			
			PreparedStatement s = con.prepareStatement(insert);
			
			s.executeUpdate();
			
			out.print("Item Posted for Sale!");
			stmt.close();
			s.close();
			db.closeConnection(con);
		} catch (Exception ex) {
			out.print(ex);
			out.print("Bid failed");
		}
		%>
	</h3>

</body>
</html>