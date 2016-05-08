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
	
	String username=session.getAttribute("username").toString();
		
	Connection conn;
	try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	} catch (InstantiationException e) {
	e.printStackTrace();

	} catch( IllegalAccessException e) {
	e.printStackTrace();	

	} catch(ClassNotFoundException e) {
	e.printStackTrace();

	}
	
	try {
		 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016?autoReconnect=true", "root", "WeHearKK290");
	
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	conn = null;
	}
	
	Statement stmt = conn.createStatement();
         
	ResultSet rset=stmt.executeQuery("select account_id from users where username='"+username+"'");
	int account_id = 0;
		if (rset.next()) {
			account_id = rset.getInt(1);
		}
	
	
	
	
  		
       //returns user information of person whose account id is 16
 		rset = stmt.executeQuery("SELECT fullname FROM users WHERE username='"+username+"'");
 		String name = "";
 		if (rset.next()) {
 			name = rset.getString(1);
 		}
 		
 		rset = stmt.executeQuery("SELECT email FROM users WHERE username='"+username+"'");
 		String email = "";
 		if (rset.next()) {
 			email = rset.getString(1);
 		}
 		rset = stmt.executeQuery("SELECT gender FROM users WHERE username='"+username+"'");
 		String gender = "";
 		if (rset.next()) {
 			gender = rset.getString(1);
 		}
 		rset = stmt.executeQuery("SELECT age FROM users WHERE username='"+username+"'");
 		int age = 0;
 		if (rset.next()) {
 			age = rset.getInt(1);
 		}
         %>
	<!-- jsp code stop-->



	<!-- HTML code start -->
		<p>This is your profile page.</p>
		Account Id: <% out.println(account_id); %>
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
		<a href="Home.jsp"><input type="button" name="Back" value="Back to Homepage" /></a>
	<!-- HTML code stop -->

</body>
</html>