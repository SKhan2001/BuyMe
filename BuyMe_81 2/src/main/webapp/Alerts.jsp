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
<body>
<div>
	<% List<String> inbox = new ArrayList<String>();
	String name = request.getParameter("name");
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date = sdf.format(d);
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		// First, check if an item of interest has become available again.
		PreparedStatement ps = con.prepareStatement("insert into Alerts values (?, ?, ?, ?);");
		Statement stmt = con.createStatement();
		int identity = (int) session.getAttribute("identity");
		ResultSet av = stmt.executeQuery("select inter.Alert_ID, inter.Account_ID, inter.Item_ID from item i, interests inter where inter.Item_ID=i.Item_ID and inter.Account_ID=" + identity + " and i.Is_Available is true;");
		int i =0, u = 0, item = 0;
		while (av.next()) {
			i = av.getInt(2);
			u = av.getInt(1);
			item = av.getInt(3);
			ps.setInt(1, u);
			ps.setInt(2, i);
			ps.setString(3, "Item # " + item + " is back up for sale!");
			ps.setString(4, date);
			ps.executeUpdate();
		}
		// Next, check if the user has won any auctions and if so, alert them about it.
		ResultSet rSet = stmt.executeQuery("select max(Alert_ID) from Alerts;");
		//Create or compute a new alert ID.
		int alertId = 0, max = 0;
		if (rSet.next()) {
			max = rSet.getInt(1);
		}
		max++;
		alertId = max;
		ResultSet won = stmt.executeQuery("select Account_ID, Item_ID from transaction_history where did_buy is true and Account_ID=" + identity + ";");
		List<Integer> it = new ArrayList<Integer>();
		while (won.next()) {
			it.add(won.getInt("Item_ID"));
		}
		String congrats = "Congratulations! You are the winner of item # : ";
		ListIterator<Integer> loop = it.listIterator();
		PreparedStatement winnerAlert = con.prepareStatement("insert into Alerts values (?, ?, ?, ?);");
		while (loop.hasNext()) {
			winnerAlert.setInt(1, alertId);
			alertId++;
			winnerAlert.setInt(2, identity);
			winnerAlert.setString(3, congrats + "" + loop.next() + "");
			winnerAlert.setString(4, date);
			winnerAlert.executeUpdate();
		}
		ResultSet al = stmt.executeQuery("select *, Content from Alerts where Account_ID=" + identity + ";");
		while (al.next()) {
			inbox.add(al.getString("Content"));
		}
		ListIterator<String> init = inbox.listIterator();
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
		while (init.hasNext()) {
			 out.println("<tr>");
			 out.println("<td>"); 
			 	out.print("||-->" + init.next());
			 out.println("</td>");
			 out.println("</tr>");
		} 
		out.println("</table>");
		stmt.close();
		al.close();
		av.close();
		ps.close();
		winnerAlert.close();
		db.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	} 
	%>
</div>
</body>
</html>