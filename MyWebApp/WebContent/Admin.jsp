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
<title>Profile Page</title>
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
	<p>This is the admin page. You can generate reports and monitor
		users as well as customer reps</p>
	<!-- HTML code stop -->

</body>
</html>