<%-- 
    Document   : Sales Per Item Page
    Created on : May 01, 2016, 6:24:08 PM
    Author     : Murtala Aliyu
--%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sales Per Item</title>
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

		//get item Id
		int itemId = 0;
		try {
			itemId = Integer.parseInt(request.getParameter("itemId"));
		} catch (Exception e) {
			out.println("Please try again");
		}
		
		//get earning per item
		int perItem = 0;
		rset = stmt.executeQuery("SELECT * FROM final_sales f WHERE f.item_id='" + itemId + "'");
		while (rset.next()) {
			perItem += (rset.getInt("quantity") * rset.getInt("sale_price"));
		}
		
		String type = "";
		rset = stmt.executeQuery("SELECT * FROM item i WHERE i.item_id='" + itemId + "'");
		while (rset.next()) {
			type = rset.getString("title");
		}
		out.println("Sales Per Item: $" + perItem);
		out.println("Item type: " + type);
	%>
	<!-- jsp code stop-->



	<!-- HTML code start -->
	<form action="PerItem.jsp" method="post">
		<p>
			Earning per item: Enter item ID <input type="number" name="itemId" />
			<input type="submit" name="Submit" value="Submit" /> <br> <br>
			<br> <a href="SalesReport.jsp"><input type="button"
				name="Back" value="Back" /></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>
