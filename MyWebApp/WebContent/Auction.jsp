<%-- 
    Document   : Auction
    Created on : Apr 25, 2016,11:56:09 AM
    Author     : Murtala Aliyu
--%>

<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Auction Page</title>
</head>

<body>
	<!-- jsp code start -->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016?autoReconnect=true", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//get title, author and genre
		String title = request.getParameter("Title");
		String author = request.getParameter("Author");
		String genre = request.getParameter("Genre");

		//itemID
		int itemId = 0;
		if (request.getParameter("Title") != null) {
			itemId = title.hashCode();
			itemId = Math.abs(itemId);
		}

		//auctionId
		int auctionId = 0;
		if (request.getParameter("Author") != null) {
			auctionId = author.hashCode();
			auctionId = Math.abs(auctionId);
		}

		//get session username
		String user = session.getAttribute("username").toString();
		//returns account_id of person who's logged in with username user
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int userId = 0;
		if (rset.next()) {
			userId = rset.getInt("account_id");
		}

		//isbn
		String temp_isbn = request.getParameter("ISBN");
		int isbn = 0;
		if (request.getParameter("ISBN") != null) {
			try {
				isbn = Integer.parseInt(request.getParameter("ISBN"));
			} catch (Exception e) {
				out.print("ISBN is invalid");
			}
		}

		//publisher
		String publisher = request.getParameter("Publisher");

		//year published
		String temp_year = request.getParameter("Year");
		int year = 0;
		int length = 0;
		if (temp_year != null) {
			length = String.valueOf(temp_year).length();
			if (length == 4) {
				year = Integer.parseInt(temp_year);
			} else {
				out.println("The year entered is invalid. Please try again.");
			}
		}

		//description
		String description = request.getParameter("Description");

		//condition
		String condition = request.getParameter("Condition");

		//reserve price
		String temp_price = request.getParameter("ReservePrice");
		double reservePrice = 0;
		if (request.getParameter("ReservePrice") != null) {
			try {
				reservePrice = Integer.parseInt(request.getParameter("ReservePrice"));
			} catch (Exception e) {
				out.println("Reserve price is invalid. Please try again.");
			}
		}

		//start price
		String temp_startPrice = request.getParameter("StartPrice");
		double startPrice = 0;
		if (request.getParameter("StartPrice") != null) {
			try {
				startPrice = Integer.parseInt(request.getParameter("StartPrice"));
			} catch (Exception e) {
				out.println("Start price is invalid. Please try again.");
			}
		}

		//current price
		double currentPrice = startPrice;

		// Get creation time. Need to fix this
		//Date startDate = new Date(session.getCreationTime());
		String startDate = "05/04/2016";

		// Get close date
		String closeDate = request.getParameter("CloseDate");
		/*int yearCheck = 1;
		if (request.getParameter("CloseDate") != null) {
			if ((closeDate.charAt(2) != '/') || (closeDate.charAt(5) != '/')) {
				out.println("Close date format is wrong,");
				yearCheck = 0;
			}
		}*/

		//Add item details to item db
		int i = 0;
		if (title != null && author != null && genre != null && isbn != 0 && publisher != null && year != 0
				&& description != null && condition != null && reservePrice != 0 && closeDate != null
				&& /*yearCheck == 1 &&*/ startPrice > 0 && reservePrice > 0 && isbn > 0) {
			try {
				i = stmt.executeUpdate(
						"INSERT INTO item(item_id,title,author,genre,isbn,publisher,year,description,item_cond) VALUES ('"
								+ itemId + "','" + title + "','" + author + "','" + genre + "','" + isbn + "','"
								+ publisher + "','" + year + "','" + description + "','" + condition + "');");
			} catch (Exception e) {
				out.print("You have entered an invalid response, ");
			}
		}
		if (i > 0) {
			out.println("added to item!");
		} else if (title == null) {

		} else {
			out.println("check adding item to db");
		}

		//Add active_auction details to db
		int j = 0;
		if (auctionId != 0 && reservePrice != 0 && startPrice != 0 && /*yearCheck == 1 &&*/ startPrice > 0
				&& reservePrice > 0 && isbn > 0) {
			try {
				j = stmt.executeUpdate(
						"INSERT INTO active_auction(auction_id,start_date,end_date,reserve_price,current_price,start_price,item_id,seller_id) VALUES('"
								+ auctionId + "','" + startDate + "','" + closeDate + "','" + reservePrice + "','"
								+ currentPrice + "','" + startPrice + "','" + itemId + "','" + userId + "');");
			} catch (Exception e) {
				out.println("please try again");
			}
		}
		if (j > 0) {
			out.println("added to active_auction");
		} else if (title == null) {

		} else {
			out.println("check adding active_auction to db");
		}

		/*	System.out.println(auctionId + ',' + startDate + ',' + closeDate + ',' + reservePrice + ',' + currentPrice
					+ ',' + startPrice + ',' + itemId + ',' + userId);*/

		stmt.close();
		conn.close();
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->

	<form action="Auction.jsp" method="post">
		<p>Fill in the item characteristics you want to sell</p>
		<p>
			Title: <input type="text" name="Title" value="" required />
		</p>
		<p>
			Author: <input type="text" name="Author" value="" required />
		</p>
		<p>
			Genre: <input type="text" name="Genre" value="" required />
		</p>
		<p>
			ISBN Number: <input type="number" name="ISBN" value="" required />
		</p>
		<p>
			Publisher: <input type="text" name="Publisher" value="" required />
		</p>
		Year Published: <input type="text" name="Year" value="" required />
		</p>
		<p>
			Description: <input type="text" name="Description" value="" required />
		</p>
		<p>
			Condition: <input type="radio" name="Condition" value="New" /> New <input
				type="radio" name="Condition" value="Used" /> Used
		</p>
		<p>
			Minimum Price (This reserve price will be hidden): <input
				type="number" name="ReservePrice" value="" required />
		</p>
		<p>
			Start Price: <input type="number" name="StartPrice" value="" required />
		<p>
			Auction Closing Date <input type="text" name="CloseDate"
				placeholder="mm/dd/yyyy" required />
		</p>
		<p>*automatically add opening date and time to db</p>

		<input type="submit" name="StartAuction" value="Start Auction" /> <a
			href="Home.jsp"><button type="button">Back to Home Page</button></a>

	</form>
	<!-- HTML code stop -->
</body>
</html>