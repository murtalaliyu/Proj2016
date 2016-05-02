<%-- 
    Document   : Forum Page
    Created on : May 01, 2016,09:59:55 PM
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
<title>Forum Page</title>
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
	<p>This is your Forum page. You can post questions and a customer
		representative will answer them. You can also view past questions
		you've asked and corresponding answers. an auto bid.</p>
	<a href="Question.jsp"><input type="button" name="Question"
		value="Ask Question" /></a>
	<a href="Homepage.jsp"><input type="button" name="back" value="Back to Homepage" /></a>
	<!-- HTML code stop -->
</body>
</html>