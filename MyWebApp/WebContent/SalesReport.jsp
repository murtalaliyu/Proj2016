<%-- 
    Document   : Sales Report Page
    Created on : May 01, 2016, 6:24:08 PM
    Author     : Murtala Aliyu
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sales Report Page</title>
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
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int userId = 0;
		if (rset.next()) {
			userId = rset.getInt("account_id");
		}

		//get total earnings
		rset = stmt.executeQuery("SELECT * FROM final_sales f WHERE f.sale_price > 0");
		int totalEarnings = 0;
		while (rset.next()) {
			totalEarnings += (rset.getInt("quantity") * rset.getInt("sale_price"));
		}
		out.println("Total earnings: $" + totalEarnings);
	%>
	<!-- jsp code stop-->



	<!-- HTML code start -->
	<form action="PerItem.jsp" method="post">
		<p>
			Earning per item: Enter item ID <input type="number" name="itemId" />
			<input type="submit" name="Submit" value="Submit" /> <br> <br>
			<br>
	</form>
	<form action="PerEndUser.jsp" method="post">
		Earning per end-user: Enter user ID <input type="number" name="userId" />
		<input type="submit" name="Submit" value="Submit" /> <br> <br>
		<br>
	</form>
	<a href="Admin.jsp"><input type="button" name="Back" value="Back" /></a>
	<!-- HTML code stop -->
</body>
</html>
