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

//stick in a random number generator for primary key.
//or hash the username to create primary key id



String username=request.getParameter("username");

int account_id =username.hashCode();
account_id=Math.abs(account_id);

//session object that lets you identify user across multiple pages
String password=request.getParameter("password");
String fullname=request.getParameter("fullname");
String email=request.getParameter("email");
String gender=request.getParameter("gender");



int age=0;

try{
	age=Integer.parseInt(request.getParameter("age"));
   }
catch (Exception e){
      response.sendRedirect("RequiredContent.html");
   }







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
	
	ResultSet rs=stmt.executeQuery("select * from users where username='"+username+"'");

	if(rs.next()) {
		
		response.sendRedirect("UsernameExistsError.html");
	}else{
		
		int i=stmt.executeUpdate("insert into users values ('"+account_id+"','"+fullname+"','"+username+"',	'"+password+"','"+email+"', '"+gender+"', '"+age+"')");
		
		session.setAttribute("username",username);
        response.sendRedirect("Home.jsp");
		
		
		
	}


       
		
		


%>


</body>
</html>