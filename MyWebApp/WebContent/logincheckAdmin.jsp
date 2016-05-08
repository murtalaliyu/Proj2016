<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import = "java.util.*" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
   <body>
        <%
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        //username is admin
        
        
        
        //this is where you set up a connection with your mysql server to check if 
        //the person is in there or not
        
        
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
		
		ResultSet rs=stmt.executeQuery("select * from users, admin where username='"+username+"' and users.account_id=admin.account_id");
		
		
		
		if(rs.next()) { 
			
			if(rs.getString(4).equals(password)) { 
				
				session.setAttribute("username",username);
	            response.sendRedirect("Admin.jsp");
	            
	            
	            out.println("it worrrked");

			}else{ 
				
				
				response.sendRedirect("PasswordError.html"); 
				
			} 
		}else{
			
			response.sendRedirect("UsernameError.html");
			
		}
        
     
        %>
    </body>
</html>