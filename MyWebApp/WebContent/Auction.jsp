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
		Connection conn = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016", "root", "WeHearKK290");
		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//Necessary IDs
		int itemId = (int) (Math.random() * 10000 + 1);
		int auctionId = (int) (Math.random() * 10000 + 1);
		//get session username
		String user = session.getAttribute("username").toString();
		//returns account_id of person who's logged in with username user
		ResultSet rset = stmt.executeQuery("SELECT * FROM users u WHERE u.username ='" + user + "'");
		int user_id = 0;
		if (rset.next()) {
			user_id = rset.getInt("account_id");
		}

		//get title, author and genre
		String title = request.getParameter("Title");
		String author = request.getParameter("Author");
		String genre = request.getParameter("Genre");

		String temp_isbn = request.getParameter("ISBN");
		int isbn = 0;
		if (temp_isbn != null) {
			isbn = Integer.parseInt(temp_isbn);
		}

		String publisher = request.getParameter("Publisher");

		String temp_year = request.getParameter("Year");
		int year = 0;
		int length = 0;
		if (temp_year != null) {
			length = String.valueOf(temp_year).length();
			if (length == 4) {
				year = Integer.parseInt(temp_year);
			} else {
				out.println("The year entered is invalid. Please Try again");
			}
		}

		String description = request.getParameter("Description");
		String condition = request.getParameter("Condition");

		String temp_price = request.getParameter("SecretPrice");
		int reservePrice = 0;
		if (temp_price != null) {
			reservePrice = Integer.parseInt(temp_price);
		}

		String temp_startPrice = request.getParameter("StartPrice");
		int startPrice = 0;
		if (temp_startPrice != null) {
			startPrice = Integer.parseInt(temp_startPrice);
		}

		int currentPrice = 0;

		// Get creation time.
		Date startDate = new Date(session.getCreationTime());

		// Get close date
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String temp_closeDate = request.getParameter("CloseDate");
		try {
			Date date = formatter.parse(temp_closeDate);
			System.out.println(date);
			System.out.println(formatter.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		//Add item details to db
		int i = 0;
		if (title != null && author != null && genre != null && isbn != 0 && publisher != null && year != 0
				&& description != null && condition != null && reservePrice != 0 && closeDate != null) {
			i = stmt.executeUpdate(
					"INSERT INTO item(item_id,title,author,genre,isbn,publisher,year,description,item_cond) VALUES ('"
							+ itemId + "','" + title + "','" + author + "','" + genre + "','" + isbn + "','"
							+ publisher + "','" + year + "','" + description + "','" + condition + "');");
		}
		if (i > 0) {
			out.println("Your auction has begun");
		} else {
			out.println("Auction failed to start");
		}

		//Add active_auction details to db
		int j = 0;
		if (auctionId != 0 && reservePrice != 0 && currentPrice != 0 && startPrice != 0) {
			j = stmt.executeUpdate(
					"INSTERT INTO active_auction(auction_id,start_date,end_date,reserve_price,current_price,start_price,item_id,seller_id) VALUES('"
							+ auctionId + "','" + startDate + "','" + closeDate + "','" + reservePrice + "','"
							+ currentPrice + "','" + startPrice + "','" + itemId + "','" + user_id + "');");
		}

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
		<p>
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
				placeholder="yyyy-MM-dd" required />
		</p>
		<p>*automatically add opening date and time to db</p>

		<button type="submit">Start Auction</button>
		<a href="Home.jsp"><button type="button">Back to Home
				Page</button></a>

	</form>
	<!-- HTML code stop -->
</body>
</html>