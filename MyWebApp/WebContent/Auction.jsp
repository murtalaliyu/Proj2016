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

		int itemId = 1;
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
		if (temp_year != null) {
			year = Integer.parseInt(temp_year);
		}
		String description = request.getParameter("Description");
		String condition = request.getParameter("Condition");
		String temp_price = request.getParameter("SecretPrice");
		int secretPrice = 0;
		if (temp_price != null) {
			secretPrice = Integer.parseInt(temp_price);
		}
		String temp_closeDate = request.getParameter("CloseDate");
		int closeDate = 0;
		if (temp_closeDate != null) {
			closeDate = Integer.parseInt(temp_closeDate);
		}
		
		int i = 0;
		if (title != null && author != null && genre != null && isbn != 0 && publisher != null && year != 0
				&& description != null && condition != null && secretPrice != 0 && closeDate != 0) {
			i = stmt.executeUpdate(
					"INSERT INTO item(item_id,title,author,genre,isbn,publisher,year,description,item_cond) VALUES ('" + itemId
							+ "','" + title + "','" + author + "','" + genre + "','" + isbn + "','"
							+ publisher + "','" + year + "','" + description + "','" + condition + "');");
			itemId++;
		}
		if (i > 0) {
			System.out.println("Successful");
		} else {
			System.out.println("Fail");
		}

		stmt.close();
		conn.close();
	%>
	<!-- jsp code stop -->


	<!-- HTML code start -->
	<form action="Auction.jsp" method="post">
		<p>Fill in the item characteristics you want to sell</p>
		<p>
			Title <input type="text" name="Title" value="" />
		</p>
		<p>
			Author <input type="text" name="Author" value="" />
		</p>
		<p>
			Genre <input type="text" name="Genre" value="" />
		</p>
		<p>
			ISBN Number <input type="text" name="ISBN" value="" />
		</p>
		<p>
			Publisher <input type="text" name="Publisher" value="" />
		</p>
		<p>
			Year Published <input type="text" name="Year" value="" />
		</p>
		<p>
			Description <input type="text" name="Description" value="" />
		</p>
		<p>
			Item Condition <input type="text" name="Condition" value="" />
		</p>
		<p>
			Minimum Price (This reserve price will be hidden) <input type="text"
				name="SecretPrice" value="" />
		</p>
		<p>
			Auction Closing Date <input type="text" name="CloseDate"
				placeholder="mm/dd/yyyy" />
		</p>
		<p>*automatically add opening date and time to db</p>
		<a href=""><button type="button">Begin
				Auction</button></a> <a href="Homepage.jsp"><button type="button">Back
				to Home Page</button></a>
	</form>
	<!-- HTML code stop -->
</body>
</html>