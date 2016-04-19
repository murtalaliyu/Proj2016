<%-- 
    Document   : Loging
    Created on : Apr 8, 2016, 9:58:18 PM
    Author     : syedmahmood
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016","root","WeHearKK290");
            Statement st = connection.createStatement();
            
          //Get the user entered username and password
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            
            if (button is clicked) {
            	if (request.getParameter("Username") == '') {
            		
            	}
            }
            
            String query_username = "SELECT username FROM users WHERE username=\'"+username+"\';";
            String query_password = "SELECT password FROM users WHERE password=\'"+password+"\';";
            System.out.println(username + " and " + password);
            
            /*   ResultSet result = st.executeQuery(query);
           
            boolean found = false;
            
            if (result.next()){
            	found = true;
            }
            while (!(username.equals(result.getString("username")) && password.equals(result.getString("password")))) {
                if (username.equals(result.getString("username")) && password.equals(result.getString("password"))) {
                    found = true;
                }
                result.next();
            }*/
            %>
     <!-- jsp code stop-->
     
     
     
     <!-- HTML code start -->
     <form action="Login.jsp" method = "post">
         <p>Username
            <input type="text" name="Username" value="" />
            </p>
            <p>Password
            <input type="text" name="Password" value="" />
            </p>
            <input type ="submit" value ="Login">
     </form>
     <!-- HTML code stop -->
            
    </body>
</html>
