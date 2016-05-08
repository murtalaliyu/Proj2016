<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            String question =request.getParameter("Id");
            out.println("QUESTION:  "+question +":"); 
            session.setAttribute("question", question);
            
            %>
            </h2>
            
            
           


<form action="CustRepAnswerIn.jsp" method="post">



<textarea name="Answer" placeholder="Answer Question here" rows="25"
			cols="70" required></textarea>



<br/><br/>

<input type="submit"/>




</form>
            


</body>
</html>