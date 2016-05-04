<%-- 
    Document   : Signup
    Created on : Apr 8, 2016, 9:58:18 PM
    Author     : syedmahmood, Murtala Aliyu
--%>

<!DOCTYPE html>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>Customer Rep Signup Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<!-- jsp code start -->
	<%
         //LoadmySQLdriver
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         //Connect to the local database
         Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016","root","WeHearKK290");
         //Create query & run it
         Statement stmt = conn.createStatement(); //object for executing a static SQL statement
        		 
         int userId = (int )(Math.random() * 100000 + 1);
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
         
         ResultSet rset = stmt.executeQuery("SELECT fullname FROM users");
         
         int i = 0;
         if (email != null && age >= 13 && fullname != null && username != null && password != null) {
        	 try {
         i = stmt.executeUpdate("INSERT INTO customer_rep(account_id,fullname,username,password,email,gender,age) VALUES ('"+userId+"','"+fullname+"','"+username+"','"+password+"','"+email+"','"+gender+"','"+age+"');");
        	 } catch (Exception e) {
        		 out.println("Oops, something went wrong. Please try again");
        	 }
         }
         if (i > 0) {
        	 System.out.println("Successful");
         } else {
        	 System.out.println("Fail");
         }
  
         
         rset.close();
         stmt.close();
         conn.close();
            %>
	<!-- jsp code stop -->




	<!-- HTML code start -->
	<form action="Signup.jsp" method="post">
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
		<input type="submit" name="signup" value="Signup"> <a
			href="index.jsp"><button type="button">Back to Main Page</button></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>
