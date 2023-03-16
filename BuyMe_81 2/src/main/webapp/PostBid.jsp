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
			
			String itemName = (String) session.getAttribute("descr");
			int opersys = (int) session.getAttribute("os");
			int userid = (int) session.getAttribute("identity");
			int bidPrice = Integer.parseInt(request.getParameter("bidprice"));
			int maxPrice = Integer.parseInt(request.getParameter("maxprice"));
			int itemNum = 0;
			ResultSet rSet;
			if (opersys == 1)
				 rSet = stmt.executeQuery("select Item_Id from Item where Windows_Description=\'" + itemName + "\';");
			else if (opersys == 2)
				rSet = stmt.executeQuery("select Item_Id from Item where Linux_Description=\'" + itemName + "\';");
			else 
				rSet = stmt.executeQuery("select Item_Id from Item where MacOS_Description=\'" + itemName + "\';");
			if (rSet.next()) {
				itemNum = rSet.getInt(1);
			}
			String insert = "INSERT INTO Post_Bid values (" + userid + ", " + itemNum + ", " + bidPrice + ", " + maxPrice + ", \'" + date + "\');";
			
			PreparedStatement s = con.prepareStatement(insert);
			
			s.executeUpdate();
			out.print("Bid Posted!");
			stmt.close();
			s.close();
			rSet.close();
			db.closeConnection(con);
		} catch (Exception ex) {
			out.print(ex);
			out.print("Bid failed");
		}
		%>
	</h3>

</body>
</html>