<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="BuyMeApp.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Welcome Screen </title>
<style>
        h1 {color:hsl(0, 100%, 45%); font-family: "Courier New", Courier New, monospace; font-size: 45px;}
		h2 {color:green; font-size: 22px;}
		h3 {color:black; font-size: 20px;}
		 a {
  			position: relative;
  			top: 10px;
  			left: 380px;
  			font-size: 20px;
		}
		a:link, a:visited {
  			background-color: white;
  			color: black;
  			border: 5px solid hsl(330, 100%, 20%);
  			padding: 10px 25px;
  			text-align: center;
  			align: left;
  			text-decoration: none;
  			display: inline-block;
		}

		a:hover, a:active {
  			background-color: hsl(120, 100%, 10%);
  			color: white;
		}
		body {
			background-color: white;
		}
</style>
</head>
<body>

<form method="post" action="PostBid.jsp"> 
	<a href ="http://localhost:8080/BuyMe_81/Search.jsp">Search</a> 
	<a href ="http://localhost:8080/BuyMe_81/Alerts.jsp">Messages</a> 
	<a href ="http://localhost:8080/BuyMe_81/Sell.jsp">Post_For_Sale</a> 
	<a href ="http://localhost:8080/BuyMe_81/Logout.jsp">Logout</a> 
	<a href ="http://localhost:8080/BuyMe_81/AccountDeletion.jsp">Delete_Account</a>
	<a href ="http://localhost:8080/BuyMe_81/QA.jsp">Get_Help</a>
	<h1> BuyMe </h1>
	<h2> You have logged in successfully. </h2>
	<h3>
		<%
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			session.setAttribute("name", name);
			session.setAttribute("pass", pass);
			out.println("Welcome, " + name + ".\n\n");
			out.println("Here are some of the newest items on sale!\n");
			try {
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				Statement stmt = con.createStatement();
				
				List<String> windows = new ArrayList<String>();
				List<String> linux = new ArrayList<String>();
				List<String> macos = new ArrayList<String>();
				ResultSet rSet = stmt.executeQuery("select max(Item_ID) from Item;");
				int max = 0, s = 1;
				if (rSet.next()) {
					max = rSet.getInt(1);
				}
				while (s <= max) {
					ResultSet os = stmt.executeQuery("select Is_Linux, Is_Mac from Item where Item_ID=" + s + ";");
					boolean lin = false; boolean mac = false;
					if (os.next()) {
						lin = os.getBoolean(1); mac = os.getBoolean(2);
					}
					if (lin == false && mac == false) {
						ResultSet windesc = stmt.executeQuery("select Windows_Description from Item where Item_ID=" + s + ";");
						if (windesc.next()) 
							windows.add(windesc.getString(1)); 
						windesc.close();
					} else if (lin == true) {
						ResultSet lindesc = stmt.executeQuery("select Linux_Description from Item where Item_ID=" + s + ";");
						if (lindesc.next()) 
							linux.add(lindesc.getString(1)); 
						lindesc.close();
					} else { 
						ResultSet macdesc = stmt.executeQuery("select MacOS_Description from Item where Item_ID=" + s + ";");
						if (macdesc.next()) 
							macos.add(macdesc.getString(1)); 
						macdesc.close(); 
					}
					s++;
				}
				ListIterator<String> it = windows.listIterator();
				ListIterator<String> lit = linux.listIterator();
				ListIterator<String> macit = macos.listIterator();
				int w = 0; 
				out.println("<table>");
				out.println("<tr>");
				out.println("<td>");
			    	out.print("|||||"); 
			    out.println("</td>");
			    out.println("<td>");
					out.print("WindowsOS"); 
				out.println("</td>");
				out.println("<td>");
					out.print("|||||"); 
				out.println("</td>");
				out.println("<td>"); 
					out.print("LinuxOS");
				out.println("</td>");
				out.println("<td>"); 
					out.print("|||||"); 
				out.println("</td>");
				out.println("<td>"); 
					out.print("MacOS"); 
				out.println("</td>");
				out.println("<td>"); 
					out.print("|||||"); 
				out.println("</td>");
				out.println("</tr>");
				String winDetail, linDetail, macDetail; int opersys = 0;
				 while (it.hasNext() || lit.hasNext() || macit.hasNext()) { 
					 out.println("<tr>");
					 out.println("<td>"); 
					 	out.print("|||||");
					 out.println("</td>");
					 out.println("<td>"); 
					 	if (it.hasNext()) {
					 		winDetail = it.next();
					 		out.println(winDetail); 
					 		session.setAttribute("descr", winDetail);
					 		opersys = 1;
					 		session.setAttribute("os", opersys);
					 		out.print("Please enter your Bid Amount.");
								out.println("<tr>");
								out.println("<td>"); 
					 			out.println("<input type=\"text\" name=\"bidprice\";>");
					 			out.println("</td>");
								out.println("</tr>");
							out.print("Please enter the maximum amount you\'re willing to pay.");
								out.println("<tr>");
								out.println("<td>"); 
					 			out.println("<input type=\"text\" name=\"maxprice\";>");
					 			out.println("</td>");
								out.println("</tr>");
					 		%> 
									<input type="submit" value="BidOnThis"> 
							<% 
					 	}
					 	else out.print("Null");
					 out.println("</td>");
					 out.println("<td>");  
					 	out.print("|||||"); 
					 out.println("</td>");
					 out.println("<td>");  
					 	if (lit.hasNext()) {
					 		linDetail = lit.next();
					 		out.println(linDetail); 
					 		session.setAttribute("descr", linDetail);
					 		opersys = 2;
					 		session.setAttribute("os", opersys);
					 	out.print("Please enter your Bid Amount.");
							out.println("<tr>");
							out.println("<td>"); 
				 			out.println("<input type=\"text\" name=\"bidprice\";>");
				 			out.println("</td>");
							out.println("</tr>");
						out.print("Please enter the maximum amount you\'re willing to pay.");
							out.println("<tr>");
							out.println("<td>"); 
				 			out.println("<input type=\"text\" name=\"maxprice\";>");
				 			out.println("</td>");
							out.println("</tr>");
					 		%> 
								<input type="submit" value="BidOnThis"> 
							<% 
					 	}
					 	else out.print("Null"); 
					 out.println("</td>");
					 out.println("<td>");  
					 	out.print("|||||"); 
					 out.println("</td>");
					 out.println("<td>");  
					 	if (macit.hasNext()) {
					 		macDetail = macit.next();
				 			out.println(macDetail); 
				 			session.setAttribute("descr", macDetail);
				 			opersys = 3;
					 		session.setAttribute("os", opersys);
					 	out.print("Please enter your Bid Amount.");
							out.println("<tr>");
							out.println("<td>"); 
				 			out.println("<input type=\"text\" name=\"bidprice\";>");
				 			out.println("</td>");
							out.println("</tr>");
						out.print("Please enter the maximum amount you\'re willing to pay.");
							out.println("<tr>");
							out.println("<td>"); 
				 			out.println("<input type=\"text\" name=\"maxprice\";>");
				 			out.println("</td>");
							out.println("</tr>");
				 		%> 
							<input type="submit" value="BidOnThis"> 
						<% 
						 }		
					 	else out.print("Null"); 
					 out.println("</td>");
					 out.println("<td>"); 
					 	out.print("|||||");
					 out.println("</td>");
					out.println("</tr>");
				} 
				out.println("</table>");
				int identity = Integer.parseInt(request.getParameter("identity"));
				session.setAttribute("identity", identity);
				stmt.close();
				rSet.close();
				db.closeConnection(con); 
			}  catch (Exception e) {
			} 
			%>
	</h3>
</form> 
</body>
</html>