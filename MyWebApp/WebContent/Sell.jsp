<%-- 
    Document   : Sell
    Created on : Apr 25, 2016,11:56:09 AM
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
<title>Sell Item Page</title>
</head>

<body>
	<!-- jsp code start -->
	<%
		//LoadmySQLdriver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connect to the local database
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016?autoReconnect=true", "root", "WeHearKK290");

		//Create query & run it
		Statement stmt = conn.createStatement(); //object for executing a static SQL statement

		//get title, author and genre
		String title = request.getParameter("Title");
		String author = request.getParameter("Author");
		String genre = request.getParameter("Genre");

		//itemID
		int itemId = 7;

		//inventoryId
		int inventoryId = 4;
		int random = (int) (Math.random() * 50000 + 1);

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
		if (temp_isbn != null) {
			try {
				isbn = Integer.parseInt(temp_isbn);
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

		//price
		String tempPrice = request.getParameter("Price");
		double price = 0;
		if (tempPrice != null) {
			try {
				price = Integer.parseInt(tempPrice);
			} catch (Exception e) {
				out.println("Price is invalid. Please try again.");
			}
		}

		// Get creation time. Need to fix this
		//Date startDate = new Date(session.getCreationTime());

		//Add item details to item db
		int i = 0;
		if (title != null && author != null && genre != null && publisher != null && year != 0
				&& description != null && condition != null && price != 0 && isbn > 0) {
			try {
				itemId = itemId * random;
				i = stmt.executeUpdate(
						"INSERT INTO item(item_id,title,author,genre,isbn,publisher,year,description,item_cond) VALUES ('"
								+ itemId + "','" + title + "','" + author + "','" + genre + "','" + isbn + "','"
								+ publisher + "','" + year + "','" + description + "','" + condition + "');");
			} catch (Exception e) {
				out.print("You have entered an invalid response, please try again");
			}
		}
		if (i > 0) {
			out.println("added to item!");
		} else if (title == null) {

		} else {
			out.println("did not add to item db");
		}

		//Add item details to active_inventory db
		int j = 0;
		if (title != null && author != null && genre != null && isbn != 0 && publisher != null && year != 0
				&& description != null && condition != null && price != 0 && isbn > 0) {
			try {
				inventoryId = inventoryId * random;
				j = stmt.executeUpdate(
						"INSERT INTO active_inventory(inventory_id,item_price,item_id,selling_user,quantity) VALUES ('"
								+ inventoryId + "','" + price + "','" + itemId + "','" + userId + "','" + 1 + "');");
			} catch (Exception e) {
				out.print("You have entered an invalid response, please try again");
			}
		}
		if (j > 0) {
			out.println("added to active_inventory!");
		} else if (title == null) {

		} else {
			out.println("did not add to active_inventory db");
		}

		stmt.close();
		conn.close();
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->

	<form action="Sell.jsp" method="post">
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
			Price: <input type="number" name="Price" value="" required />
		</p>

		<p>*automatically add opening date and time to db</p>

		<button type="submit" name="SellItem">Sell Item</button>
		<a href="Home.jsp"><button type="button">Back to Home
				Page</button></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>