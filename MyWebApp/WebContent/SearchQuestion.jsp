<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import = "java.util.*" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="Search.html"><button type="button">Back</button></a>
<a href="Home.jsp"><button type="button">Home</button></a>
<br/><br/>
<p> Search Results: </p>

<%
	String question=request.getParameter("question");
	out.println("You have searched for the question: " + question);
	
	
	
	
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
	
	ResultSet rs=stmt.executeQuery("select forum.question, forum.answer from forum where question='"+question+"'");
	
	
	
	   
    
    while(rs.next()){ 
%>
<br/><br/>
    <TABLE BORDER="1">
        <TR>
            <TH>QUESTION</TH>
            <TH>ANSWER</TH>
            
        </TR>
        <TR>
            <TD> <%= rs.getString(1) %> </TD>
            <TD> <%= rs.getString(2) %> </TD>
        </TR>
    </TABLE>
<% 
    } 
%>
	
	

	

</body>
</html>