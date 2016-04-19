<%-- 
    Document   : Signup
    Created on : Apr 8, 2016, 9:58:18 PM
    Author     : syedmahmood, Murtala Aliyu
--%>

<!DOCTYPE html>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>Signup Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    
         <!-- jsp code start -->
         <%
         Connection connection = null;
  //       try {
        	 Class.forName("com.mysql.jdbc.Driver").newInstance();
        	 connection = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016","root","WeHearKK290");
         /*}
         catch(Exception e){
        	 System.out.print("<p>Could not connect to SQL server.</p>");
        	 e.printStackTrace(System.out);
        	 }*/

         String fullname = request.getParameter("Fullname");
         String username = request.getParameter("Username");
         String password = request.getParameter("Password");
         String email = request.getParameter("Email");
         String gender = request.getParameter("Gender");
         int age = Integer.parseInt(request.getParameter("Age").trim());
         
         if (fullname != null && username != null && password != null && email != null && gender != null && age > 10) {
        	 Statement st = connection.createStatement();
        	 String query = "INSERT INTO users (account_id, fullname, username, password, email, gender, age) VALUES (\'" + 1 + "\', \'" + fullname + "\', \'" + username + "\', \'" + password + "\', \'" + email + "\', \'" + gender + "\', \'" + age + "\')";
        	 int sum = st.executeUpdate(query);
        	 st.close();
         }
         
            connection.close();
            %>
   		<!-- jsp code stop -->
    
    
    
    
    <!-- HTML code start -->
    	<form action="signup.jsp" method = "post">
        	<p>Full name
            <input type="text" name="Fullname" value="" />
            </p>
            <p>Username
            <input type="text" name="Username" value="" />
            </p>
            <p>Password
            <input type="text" name="Password" value="" />
            </p>
            <p>Email
            <input type="text" name="Email" value="" />
            </p>
            <p>Gender
            <input type="text" name="Gender" value="" />
            </p>
            <p>Age
            <input type="text" name="Age" value="" />
            </p>
            <input type ="submit" value ="Signup">
     </form>
    <!-- HTML code stop -->
    </body>
</html>
