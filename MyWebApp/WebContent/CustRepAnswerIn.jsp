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

String question=session.getAttribute("question").toString();

String answer=request.getParameter("Answer");



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

int j=0;

j=stmt.executeUpdate("UPDATE forum set answer='" + answer+ "' where question='" +question+ "'");


if(j!=0){
	out.println("Yay! Question has been succssfully answered!");
}



%>


<a href="Rep.jsp"><button type="button">Back to Answering Questions</button></a>

</body>
</html>