<%-- 
    Document   : Answer Page
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
<title>Answer Page</title>
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
		int forumId = 0, questNum = 0;
		if (rset.next()) {
			forumId = rset.getInt("forum_id");
			questNum = rset.getInt("question_num");
			//System.out.println(forumId + ',' + questNum);
		}
		while (rset.next()) {
			question = rset.getString("question");
		}
	%><p>
		<%
			out.println("Question: " + question);
		%>
	</p>
	<textarea name="Question" placeholder="Post answer here" rows="25"
		cols="70"></textarea>
	<br>
	<input type="submit" name="Answer" value="Submit" />
	<a href="Rep.jsp"><input type="button" name="back" value="Back" /></a>

	<%
		//add question to db
		int j = 0, answerId = 2;
		int random = (int) (Math.random() * 50000 + 1);
		if (request.getParameter("Answer") != null) {
			try {
				answerId = answerId * random;
				//System.out.println(answer);
				j = stmt.executeUpdate(
						"INSERT INTO forum(forum_id,asker_id,answer_id,question,answer,question_num) VALUES ('"
								+ forumId + "','" + userId + "','" + answerId + "','" + question + "','" + answer
								+ "','" + questNum + "');");
			} catch (Exception e) {
				System.out.println("Looks like an error. Try again");
			}
		}
		if (j > 0) {
			System.out.println("done");
		} else {
			System.out.println("nope");
		}
	%>

	<!-- jsp code stop -->


	<!-- HTML code start -->
	<form action="Answer.jsp" method="post"></form>
	<!-- HTML code stop -->
</body>
</html>