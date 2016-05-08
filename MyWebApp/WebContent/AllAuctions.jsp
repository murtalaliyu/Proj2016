<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
    
<%@ page import="java.sql.*"
		 import="java.math.BigDecimal" 
		 import = "java.text.DateFormat"
		 import = "java.util.Date"%>

<!-- This page lists all the bids for a specific auction.  -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>List of Auctions</title>
	</head>

<body>

	
	
<form action="Bid.jsp" method="post">

Place bid on item_id <input type="text" name="item_id" required /><br/><br/>
Amount you would like to bid <input type="text" name="bid_price" required /><br/><br/>

<input type="submit"/>
</form>
<hr>
<p> If you want to see what auctions a <strong>user</strong> has participated in , type in the username. </p>
<form action="UserAuctionHistory.jsp" method = "post">
Type in the username <input type = "text" name = "username" required /><br/><br/>

<input type = "submit"/>

</form>
<hr>

<h3>Active Auctions</h3>
	
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

		Statement stmt1 = conn.createStatement(); 
		
		/*	The resulting set of all the active auctions. */
		ResultSet rs = stmt1.executeQuery( "SELECT item.item_id, item.title, item.author, item.genre, item.isbn, item.publisher, item.year, item.description, item.item_cond, active_auction.current_price, active_auction.end_date FROM item, active_auction WHERE item.item_id=active_auction.item_id");	
		int i;
		while(rs.next()){ 
				String end_date = rs.getString(11);
				Date today = new Date();
				String aEndDay = end_date.substring(3, 5), aEndMonth = end_date.substring(0, 2), aEndYear = end_date.substring(6);
				int EndDay = Integer.parseInt(aEndDay);
				int EndMonth = Integer.parseInt(aEndMonth);
				int EndYear = Integer.parseInt(aEndYear);
				
				if (today.getYear() <= EndYear && today.getMonth() <= EndMonth && today.getDay() <= EndDay) {
				
					%>
					<br/><br/>
					    <TABLE BORDER = "1">
					        <TR>
					            <TH>ITEM_ID</TH>
					            <TH>TITLE</TH>
					            <TH>AUTHOR</TH>
					            <TH>GENRE</TH>
					            <TH>ISBN</TH>
					            <TH>PUBLISHER</TH>
					            <TH>YEAR</TH>
					            <TH>DESCRIPTION</TH>
					            <TH>CONDITION</TH>
					            <TH>CURRENT PRICE</TH>
					            <TH>END DATE </TH>
					        </TR>
					        <TR>
					            <TD> <%= rs.getString(1) %> </TD>
					            <TD> <%= rs.getString(2) %> </TD>
					            <TD> <%= rs.getString(3) %> </TD>
					            <TD> <%= rs.getString(4) %> </TD>
					            <TD> <%= rs.getString(5) %> </TD>
					            <TD> <%= rs.getString(6) %> </TD>
					            <TD> <%= rs.getString(7) %> </TD>
					            <TD> <%= rs.getString(8) %> </TD>
					            <TD> <%= rs.getString(9) %> </TD>
					            <TD> <%= rs.getString(10) %> </TD>
					            <TD> <%= rs.getString(11) %> </TD>
					            
					            
					        </TR>
					    </TABLE>
					<% 
				} }
				%>
		
		
</body>
</html>