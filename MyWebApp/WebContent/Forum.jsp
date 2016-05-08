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

<h1>Welcome to the forum!</h1>
<p> Feel free to browse questions that have already been asked or ask your own questions!</p>

<body>

<a href="Question.jsp"><input type="button" name="Question"
		value="Ask Question" /></a>
	<a href="Home.jsp"><input type="button" name="back"
		value="Back to Homepage" /></a>
		<br/><br/>
		
		
	<!-- jsp code start -->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016?autoReconnect=true", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//get session username
		String user = session.getAttribute("username").toString();
		//returns account_id of person who's logged in with username user
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int userId = 0;
		if (rset.next()) {
			userId = rset.getInt("account_id");
		}
		
		//get past questions and corresponding answer
		rset = stmt.executeQuery("SELECT * FROM forum f WHERE f.asker_id ='" + userId + "'");
		String question = "", answer = "";
		while (rset.next()) {
			question = rset.getString("question");
			%><p><%out.println("Question: " + question); %></p>
			<% answer = rset.getString("answer"); %>
			<p> <%out.println("Answer: " + answer); %> </p>
			<hr>
			
		<%} %>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	
	
	<br>
	<br>
	<br>
	<br>
	<%
		
	%>
	<!-- HTML code stop -->
</body>
</html>