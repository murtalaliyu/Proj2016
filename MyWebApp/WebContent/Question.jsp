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

		//get question from form
		String question = "";
		if (request.getParameter("Question") != null) {
			question = request.getParameter("Question");
			System.out.println(question);
		}

		//get session username
		String user = session.getAttribute("username").toString();
		//out.println(user);

		//returns account_id of person who's logged in with username user
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int user_id = 0;
		if (rset.next()) {
			user_id = rset.getInt("account_id");
		}
		//out.println(x);

		//add question to db
		int j = 0;
		if (request.getParameter("Question") != null) {
			j = stmt.executeUpdate("INSERT INTO forum VALUES('" + user_id + "','" + 2 + "','" + 3 + "','" + question
					+ "'+'answer')");
		}
		if (j > 0) {
			System.out.println("done");
		} else {
			System.out.println("nope");
		}
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	<form action="Question.jsp" method="post">
		<textarea name="Question" placeholder="Post question here" rows="25"
			cols="70"></textarea>
		<br> <input type="button" name="submit" value="Submit" /> <a
			href="Forum.jsp"><input type="button" name="back" value="Back" /></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>