<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>
            <%
            String a=session.getAttribute("username").toString();
            out.println("Hello  "+a +"!");
            out.println("Welcome to your YABE customer rep account!\n");
            
            
            %>
            </h2>
            
            <hr>
            
            <p> Your main focus is to answer questions on the forum! </p>
             <p> Here is a list of unanswered questions! </p>
             
             <%
             
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
     		
     		
     		ResultSet rs=stmt.executeQuery("select forum.question, forum.answer from forum where forum.answer='This question does not have an answer yet.'");
             
             
	

		    
		    
		    
		    while(rs.next()){ 
		%>
		<br/><br/>
		    <TABLE BORDER="1">
		        <TR>
		            <TH>QUESTION</TH>
		            <TH>ANSWER</TH>
		         
		            
		        </TR>
		        <TR>
		             <td>
    <a href=<%= "\"CustRepAnswer.jsp?Id=" + rs.getString(1) + "\"" %> ><%= rs.getString(1) %></a>
</td>
	
		            <TD> <%= rs.getString(2) %> </TD>
		          
		        </TR>
		    </TABLE>
		<% 
		    } 
		%>
			
			
			



             
             
             
             
             
             
             
 <br/><br/>            
             
<a href="Forum.jsp"><button type="button">Preview how the user sees the forum</button></a>        
             
             
             
             
             
             
 <a href="Logout.jsp"><button type="button">Logout</button></a>            
             
          
             
             
             

</body>
</html>