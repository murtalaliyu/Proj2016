<%-- 
    Document   : Admin Page
    Created on : May 01, 2016, 6:24:08 PM
    Author     : Murtala Aliyu
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Rep Page</title>
</head>

<body>

	<!-- jsp code start-->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement
	%>
	<!-- jsp code stop-->



	<!-- HTML code start -->
	<p>This is the Customer representative page. You can answer user
		questions, modify any info (only if necessary), remove illegal bids
		and illegal auction.</p>
	<a href="Answer.jsp"><input type="button" name="AnswerQuestion"
		value="Answer User Questions" /></a>
	<a href="EditProfile.jsp"><input type="submit" name="Modify" value="Modify this user's account" /></a>
	<input type="button" name="ModifyRepAccount" value="Modify Rep Account" />
	<input type="button" name="Report" value="Generate Report" />
	<!-- HTML code stop -->

</body>
</html>
