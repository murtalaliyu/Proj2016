<%-- 
    Document   : Sales Per end-user Page
    Created on : May 01, 2016, 6:24:08 PM
    Author     : Murtala Aliyu
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sales Per end-user</title>
</head>

<body>

	<!-- jsp code start-->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//get session username
		String user = session.getAttribute("username").toString();
		//returns account_id of person who's logged in with username user
		//get item Id
		int userId = 0;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			out.println("Please try again");
		}

		//get earning per user
		int perUser = 0;
		ResultSet rset = stmt.executeQuery("SELECT * FROM final_sales f WHERE f.buyer_id='" + userId + "'");
		while (rset.next()) {
			perUser += (rset.getInt("quantity") * rset.getInt("sale_price"));
		}
		out.println("Sales Per User: $" + perUser);
		out.println("User type: Buyer");
	%>
	<!-- jsp code stop-->



	<!-- HTML code start -->
	<form action="PerEndUser.jsp" method="post">
		<p>
			Earning per end-user: Enter user ID <input type="number"
				name="userId" /> <input type="submit" name="Submit" value="Submit" />
			<br> <br> <br> <a href="SalesReport.jsp"><input
				type="button" name="Back" value="Back" /></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>
