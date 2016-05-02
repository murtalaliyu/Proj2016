<%-- 
    Document   : Loging
    Created on : Apr 8, 2016, 9:58:18 PM
    Author     : Murtala Aliyu
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
            
          //Get the user entered username and password
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            
          //Print 5 spaces
            for (int i = 0; i < 5; i++) {
            	System.out.println();	
            } 
        		 
          //Check if username is in database, and if password matches
    //    if (username != null) {
            ResultSet rset = stmt.executeQuery("SELECT username FROM users");
            while (rset.next()) {
     //         System.out.println(rset.getString(1));
                if (rset.getString(1) == request.getParameter("Username")) {
                	System.out.println("username matches");
                } else {
                	System.out.println("username does not match");
                }
            }
       // }
            
            %>
     <!-- jsp code stop-->
     
     
     
     <!-- HTML code start -->
     <form action="Homepage.jsp" method = "post">
         <p>Username
            <input type="text" name="Username" value="" />
            </p>
            <p>Password
            <input type="password" name="Password" value="" />
            </p>
            <input type ="submit" value ="Login" >
            <a href="index.jsp"><button type="button">Back to Main Page</button></a>
     </form>
     <!-- HTML code stop -->
            
    </body>
</html>
