<%-- 
    Document   : Automatic Bid
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
<title>Automatic Bid page</title>
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
	<p>Set your automatic bid here</p>
	<form action="AutoBid.jsp" method="post">
		<p>
			Upper Limit (This is secret): <input type="number"
				name="SecretUpperLimit" value="" />
		</p>
		<p>
			Put in a higher bid automatically: <input type="number"
				name="AutomaticBid" value="" />
		</p>
		<a href=""><button type="submit">Submit Bid</button></a> <a
			href="Bid.jsp"><input type="button" name="back" value="Back" /></a>
	</form>

	<!-- HTML code stop -->
</body>
</html>