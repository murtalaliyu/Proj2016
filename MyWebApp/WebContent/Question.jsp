<%-- 
    Document   : Question Page
    Created on : May 01, 2016,10:04:27 PM
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
<title>Question Page</title>
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
		<textarea name="question" placeholder="Post question here" rows="25" cols="70"></textarea>
		<br>
		<input type="button" name="submit" value="Submit" />
		<a href="Forum.jsp"><input type="button" name="back" value="Back" /></a>
	<!-- HTML code stop -->
</body>
</html>