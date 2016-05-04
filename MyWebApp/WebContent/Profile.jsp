<%-- 
    Document   : Profile
    Created on : Apr 28, 2016, 6:35:32 PM
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
         Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016","root","WeHearKK290");
         //Create query & run it
         Statement stmt = conn.createStatement(); //object for executing a static SQL statement
         
         ResultSet rset = stmt.executeQuery("SELECT account_id FROM users WHERE account_id = 16");
  		int id = 0;
  		if (rset.next()) {
  			id = rset.getInt(1);
  		}
       //returns user information of person whose account id is 16
 		rset = stmt.executeQuery("SELECT fullname FROM users WHERE account_id = 16");
 		String name = "";
 		if (rset.next()) {
 			name = rset.getString(1);
 		}
 		rset = stmt.executeQuery("SELECT username FROM users WHERE account_id = 16");
 		String username = "";
 		if (rset.next()) {
 			username = rset.getString(1);
 		}
 		rset = stmt.executeQuery("SELECT email FROM users WHERE account_id = 16");
 		String email = "";
 		if (rset.next()) {
 			email = rset.getString(1);
 		}
 		rset = stmt.executeQuery("SELECT gender FROM users WHERE account_id = 16");
 		String gender = "";
 		if (rset.next()) {
 			gender = rset.getString(1);
 		}
 		rset = stmt.executeQuery("SELECT age FROM users WHERE account_id = 16");
 		String age = "";
 		if (rset.next()) {
 			age = rset.getString(1);
 		}
 		
 		//String user = session.getAttribute("username").toString();
 		
         %>
	<!-- jsp code stop-->



	<!-- HTML code start -->
		<p>This is your profile page.</p>
		Account Id: <% out.println(id); %>
		<br><br>
		Name: <% out.println(name); %>
		<br><br>
		Username: <% out.println(username); %>
		<br><br>
		Email: <% out.println(email); %>
		<br><br>
		Gender: <% out.println(gender); %>
		<br><br>
		Age: <% out.println(age); %>
		<br><br>
		<a href="EditProfile.jsp"><input type="button" name="Edit" value="Edit my Profile" /></a>
		<a href="Home.jsp"><input type="button" name="Back" value="Back to Home page" /></a>
	<!-- HTML code stop -->

</body>
</html>
