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

<h1>Ask a question!</h1>

<body>
	<!-- jsp code start -->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016?autoReconnect=true", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement
		//get question from form
		String question="";
		if (request.getParameter("Question") != null) {
			question = request.getParameter("Question");
			//System.out.println(question);
		}
		//get session username
		String user = session.getAttribute("username").toString();
		
		//hash the ids
		int forum_id = 2;
		
		//set question_num
		int questions = 10;
		int random = (int )(Math. random() * 50000 + 1);
		//returns account_id of person who's logged in with username user
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int user_id = 0;
		if (rset.next()) {
			user_id = rset.getInt("account_id");
		}
		
		//placeholder for answer
		String answer = "This question does not have an answer yet.";
		//add question to db
		int j = 0;
		if (!question.equals("")) {
			questions = questions * random;
			try {
			forum_id = forum_id * random;
			j = stmt.executeUpdate("INSERT INTO forum(forum_id,asker_id,answer_id,question,answer,question_num) VALUES ('"
					+ forum_id + "','" + user_id + "','" + 3 + "','" + question + "','" + answer + "','" + questions + "');");
			} catch (Exception e) {
				System.out.println("Looks like an error. Try again");
			}
		}
		if (j > 0 && !question.equals("")) {
			out.println("Your question has been successfully posted!");
		} else {
			out.println("Please input question your question below!");
		}
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	<form action="Question.jsp" method="post">
		<textarea name="Question" placeholder="Post question here" rows="25"
			cols="70"></textarea>
		<br> <input type="submit" name="Ask" value="Submit" /> <a
			href="Forum.jsp"><input type="button" name="back" value="Back" /></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>