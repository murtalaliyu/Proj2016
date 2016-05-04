<%-- 
    Document   : Buyer Bid
    Created on : Apr 28, 2016,02:35:45 PM
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
<title>Buyer Bid</title>
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
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	<p>This is your Bid page, it contains all information regarding
		your past and current bids. You have the option of bidding manually or
		setting an auto bid.</p>
	<a href="AutoBid.jsp"><button type="submit" name="AutoBid" value="">Set
			Automatic Bid</button></a>
	<a href="ManualBid.jsp"><button type="submit" name="ManualBid"
			value="">Bid Manually</button></a>
	<a href="Home.jsp"><button type="submit" name="Back">Back
			to HomePage</button></a>

	<!-- HTML code stop -->
</body>
</html>