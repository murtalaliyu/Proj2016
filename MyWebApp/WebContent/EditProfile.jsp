<%-- 
    Document   : Profile Editing Page
    Created on : May 01, 2016,10:24:30 PM
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
<title>Edit my Profile</title>
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
	<form action="EditProfile.jsp" method="post">
		<p>
			Full name <input type="text" name="Fullname" value="" />
		</p>
		<p>
			Username <input type="text" name="Username" value="" />
		</p>
		<p>
			Password <input type="password" name="Password" value="" />
		</p>
		<p>
			Email <input type="text" name="Email" value="" />
		</p>
		<p>
			Gender <input type="text" name="Gender" value="" />
		</p>
		<p>
			Age <input type="text" name="Age" value="" />
		</p>
		<p>
			Old password <input type="text" name="OldPass" value="" />
		</p>
		<p>
			New password <input type="text" name="NewPass" value="" />
		</p>
		<p>
			Confirm new password <input type="text" name="NewPass" value="" />
		</p>
		<input type="submit" name="signup" value="Edit My Profile"> <a
			href="Profile.jsp"><button type="button">Back to Profile</button></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>