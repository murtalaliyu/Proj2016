<%-- 
    Document   : Buyer Bid
    Created on : Apr 28, 2016,02:35:45 PM
    Author     : Murtala Aliyu
--%>

<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*" import = "java.Math.*" import = "java.text.DateFormat" import = "java.util.Date"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Buyer Bid</title>
</head>

<a href="AllAuctions.jsp"><button type="button">Back</button></a>
<a href="Home.jsp"><button type="button">Home</button></a>



<body>
	<h2>Bid History for this auction.</h2>

	<%
	
	int item_id=0;

	try {
		item_id=Integer.parseInt(request.getParameter("item_id"));
		 
	}
	catch (Exception e){
	      response.sendRedirect("RequiredContent.html"); 
	      
	}
	
	int bid_price=0; // Bid_price that the user has entered. 

	try {
		bid_price=Integer.parseInt(request.getParameter("bid_price"));
		
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
		e.printStackTrace();
		conn = null;
		
	}
	
	/* Check if user inputted bid price is more than current price. */
	Statement stmt1 = conn.createStatement();
	
	ResultSet set = stmt1.executeQuery("SELECT * FROM active_auction WHERE item_id = " + item_id);
	set.next();
	int auction_id = set.getInt("auction_id");
		
	Statement stmt = conn.createStatement();
		
	ResultSet rs=stmt.executeQuery("select * from active_auction where item_id=" + item_id);
	rs.next();
	int book_price = rs.getInt("current_price");
	boolean doUpdate = false;
	if (bid_price > book_price ) {
		book_price = bid_price;
		doUpdate = true;
	}
	
	Statement stmt2 = conn.createStatement();
	stmt2.executeUpdate("UPDATE active_auction SET current_price =" + book_price + " WHERE active_auction.item_id=" + item_id);
	
	int bid_id = (int) Math.floor(Math.random() * 1000);
	Statement stmt_bid = conn.createStatement();
	Date datet = new Date();
	String date = datet.toString();
	//bidder_id
	String username = session.getAttribute("username").toString();
	Statement stmt_user_id = conn.createStatement();
	ResultSet rs3 = stmt_user_id.executeQuery("SELECT * FROM users WHERE username = '" + username + "'");
	rs3.next();
	int bidder_id = rs3.getInt("account_id");
	
	if (doUpdate) {
		stmt_bid.executeUpdate("INSERT INTO bid VALUES ("+ bid_id  +", " + book_price + ", '" + date  + "', " + bidder_id + ",  " + auction_id + ", " + item_id + ")");
	}
	
	
	/* Now the user can see all the previous bids for this item.  */
	
	Statement stmt3 = conn.createStatement(); 
			
	/*	The resulting set of the bids of this auction. */
	ResultSet bids = stmt3.executeQuery( "SELECT * FROM bid WHERE bid.auction_id=" + auction_id );
	
	while(bids.next()) {
		/* 	For each bid, print the username, price, and time. */
		
		int bidder_id_new = bids.getInt("bidder_id");
		Statement stmt4 = conn.createStatement();
		ResultSet users = stmt4.executeQuery( "SELECT * FROM users WHERE account_id=" + bidder_id );
		users.next();
		
		String the_username = users.getString("username");
		
		int latestBidPrice = bids.getInt("bid_price");
		
		String time = bids.getString("time");
	%>
		<p>  <% out.println( "User:    " + the_username + "          Price:    " + latestBidPrice + "              Time:    " + time); %>
		</p>
		<hr>
	<%}%>
	
	
 	
		

	<p> Thanks for bidding </p>
</body>
</html>