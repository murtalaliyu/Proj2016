<%-- 
    Document   : Manual Bid
    Created on : Apr 28, 2016,02:35:45 PM
    Author     : Murtala Aliyu
--%>

<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Manual Bid page</title>
</head>

<body>
	<!-- jsp code start -->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//get new manual bid
		String tManualBid = request.getParameter("ManualBid");
		int manualBid = 0;
		if (tManualBid != null) {
			try {
				manualBid = Integer.parseInt(tManualBid);
			} catch (Exception e) {
				out.println("Your bid is invalid. Please try again.");
			}
		}

		//get session username
		String user = session.getAttribute("username").toString();

		//returns bidder's id
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int userId = 0;
		String fullname = "";
		if (rset.next()) {
			userId = rset.getInt("account_id");
			fullname = rset.getString("fullname");
		}

		//create bidId
		int bidId = fullname.hashCode();
		bidId = Math.abs(bidId);

		//get current time. Needs to be fixed
		String time = "08:40pm";

		//get auctionID and itemId
		rset = stmt.executeQuery("SELECT * FROM item i WHERE i.item_id ='" + placeholderforitemid + "'");
		int auctionId = 0, itemId = 0;
		if (rset.next()) {
			auctionId = rset.getInt("auction_id");
			itemId = rset.getInt("item_id");
		}
		System.out.println(itemId);

		//add bid to db
		int i = 0;
		if (manualBid > 0) {
			try {
				i = stmt.executeUpdate(
						"INSERT INTO bid(bid_id,bid_price,time,bidder_id,auction_id,item_id,upper_limit) VALUES ('"
								+ bidId + "','" + manualBid + "','" + time + "','" + userId + "','" + auctionId
								+ "','" + itemId + "','" + 0 + "');");
			} catch (Exception e) {
				out.print("Your bid is invalid. Please try again.");
			}
		}
		if (i > 0) {
			out.println("Bid successful!");
			response.sendRedirect("Home.jsp");
		} else {
			out.println("Bid unsuccessful");
		}
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	<p>Set your bid manually</p>
	<form action="ManualBid.jsp" method="post">
		<p>
			Set new Bid (should not be less than your last bid): <input
				type="number" name="HigherBid" />
		</p>
		<input type="submit" name="ManualBid" value="Submit Bid" /> <a
			href="Bid.jsp"><input type="button" name="Back"
			value="Back to Main Bid Page" /></a>
	</form>

	<!-- HTML code stop -->
</body>
</html>