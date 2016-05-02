<%-- 
    Document   : Auction
    Created on : Apr 25, 2016,11:56:09 AM
    Author     : Murtala Aliyu
--%>

<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Home Page</title>
</head>

<body>
	<!-- jsp code start -->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//gets particular user's username
		//String a = session.getAttribute("username").toString();

		//returns name of person whose account id is 16
		ResultSet rset = stmt.executeQuery("SELECT fullname FROM users WHERE account_id = 16");
		String name = "";
		if (rset.next()) {
			name = rset.getString(1);
		}
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	<%
		if (session.isNew()) {
			out.println("Welcome, " + name);
		} else {
			out.println("Welcome back, " + name + ". Today's date is " + new Date(session.getCreationTime()));
		}
	%>
	<p>This is your home page where you can post items up for sale, or
		bid for products you like.</p>
	<a href="Auction.jsp"><button type="button">Post Item to
			Sell</button></a>
	<a href="Bid.jsp"><button type="button">Buy Item</button></a>
	<a href="Profile.jsp"><button type="button">My Profile</button></a>
	<a href="History.jsp"><button type="button">View
			Auction/Bid History</button></a>
	<a href="Forum.jsp"><button type="button">Forum</button></a>
	<!-- HTML code stop -->
</body>
</html>