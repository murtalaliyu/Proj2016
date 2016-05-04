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

		int userId = (int) (Math.random() * 100000 + 1);
		String fullname = request.getParameter("Fullname");
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		String email = request.getParameter("Email");
		String gender = request.getParameter("Gender");
		String temp_age = request.getParameter("Age");
		int age = 0;
		try {
			age = Integer.parseInt(request.getParameter("age"));
		} catch (Exception e) {
			response.sendRedirect("RequiredContent.html");
		}
		String oldPass = request.getParameter("OldPass");
		String newPass1 = request.getParameter("NewPass1");
		String newPass2 = request.getParameter("NewPass2");

		if (newPass1 != newPass2) {
			try {
				out.println("new passwords match");
			} catch (Exception e) {
				out.println("Please confirm you new password again");
			}
		}

		//get session username
		String user = session.getAttribute("username").toString();
		//returns account_id of person who's logged in with username user
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int user_id = 0;
		if (rset.next()) {
			user_id = rset.getInt("account_id");
		}

		//add to database
		int j = 0;
		try {
			j = stmt.executeUpdate(
					"INSERT INTO user(account_id,fullname,username,password,email,gender,age) VALUES ('" + user_id
							+ "','" + fullname + "','" + username + "','" + newPass2 + "','" + email + "','" + gender
							+ "','" + age + "');");
		} catch (Exception e) {
			System.out.println("Looks like an error. Try again");
		}

		if (j > 0) {
			System.out.println("done");
		} else {
			System.out.println("nope");
		}
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
			New password <input type="text" name="NewPass1" value="" />
		</p>
		<p>
			Confirm new password <input type="text" name="NewPass2" value="" />
		</p>
		<input type="submit" name="signup" value="Edit My Profile"> <input
			type="submit" name="deleteAccount" value="Delete account" /> <a
			href="Profile.jsp"><button type="button">Back to Profile</button></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>