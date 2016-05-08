<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"%>
<%@ page import="java.sql.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br/><br/>
<h2>
            <%
            String a=session.getAttribute("username").toString();
            out.println("Hello  "+a +"!");
            out.println("Welcome to your YABE account!\n");
            out.println(". Today's date is " + new Date(session.getCreationTime()));
        
            %>
            </h2>
            
<p>This is your home page where you can post items up for sale, or
		bid for products you like.</p>
	<a href="Auction.jsp"><button type="button">Start Auction</button></a>
	<a href="Sell.jsp"><button type="button">Sell Item</button></a>
	
	
	<a href="History.jsp"><button type="button">View
			Auction/Bid History</button></a>
	<a href="AllAuctions.jsp"><button type="button">View
			Live Auctions</button></a>
	<a href="Forum.jsp"><button type="button">Forum</button></a>
	<a href="Profile.jsp"><button type="button">My Profile</button></a>

<br/><br/>
<a href="Search.html"><button type="button">Search</button></a>
<br/><br/>
<br/><br/>
<br/><br/>
<a href="Logout.jsp"><button type="button">Logout</button></a>

</body>
</html>