<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
    
<%@ page import="java.sql.*" %>

<!-- This page lists the auctions that a specific user has participated in.  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>User Auction History</title>
	</head>

<body>

	<p> Auctions that User has participated in. </p>
	
	<%	
		/* Connect to the database. */
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
			e.printStackTrace();
			conn = null;
	
		}
		
		/*	Get the userId of the user whose auctions we are viewing. */
		String username = request.getParameter("username");
		Statement stmt_for_user = conn.createStatement();
		ResultSet userid = stmt_for_user.executeQuery("SELECT * FROM users WHERE username = '" + username + "'");
		int userId;
		if (userid.next()) {
			userId = userid.getInt("account_id");
		} else {
			response.sendRedirect("GenericError.html"); 
			userId = 0;
		}
		
		Statement stmt1 = conn.createStatement(); 
		
		/*	The resulting set of the auctions of this user. */
		ResultSet auctions = stmt1.executeQuery( "SELECT DISTINCT auction_id, item_id FROM bid WHERE bidder_id=" + userId );
		
	%>
	
	<p></p>
	
	<% 
		while(auctions.next()) {
			
			/* 	For each auction_id, print the item name and end date of the auction.  */
			int item_id = auctions.getInt("item_id");
			Statement stmt2 = conn.createStatement();
			ResultSet item = stmt2.executeQuery( "SELECT * FROM item WHERE item_id=" + item_id );
			item.next();
			String item_title = item.getString("title");
	
			
			int auction_id = auctions.getInt("auction_id");
			Statement stmt3 = conn.createStatement();
			ResultSet auction = stmt3.executeQuery( "SELECT * FROM active_auction WHERE auction_id=" + auction_id);
			auction.next();
			String endDate = auction.getString("end_date");
	
	%><p>
	  <% out.println("Title: 	" + item_title + "         		 End Date of Auction: 	" + endDate); %>
		<hr>
	<%}%> 
		
		
</body>
</html>