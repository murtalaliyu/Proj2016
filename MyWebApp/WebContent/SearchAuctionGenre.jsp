<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import = "java.util.*" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="SearchAuctionGenre.html"><button type="button">Back</button></a>
<a href="Home.jsp"><button type="button">Home</button></a>
<br/><br/>
<p> Search Results: </p>



<%
	String genre=request.getParameter("genre");
	out.println("You have searched for the genre: " + genre);
	String sort=request.getParameter("sort");
	
	if(sort!=null){
		out.println("(results sorted with " + sort + ")" );
		
		if(sort.equals("price")){
			sort="active_inventory.item_price";
		}else if(sort.equals("title")){
			sort="item.title";
		}else if(sort.equals("author")){
			sort="item.author";
		}else if(sort.equals("genre")){
			sort="item.genre";
		}else if(sort.equals("publisher")){
			sort="item.publisher";
		}else if(sort.equals("year")){
			sort="item.year";
		}else{
			
		}	
		
		
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
		// TODO Auto-generated catch block
		e.printStackTrace();
		conn = null;
		}
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs=stmt.executeQuery("select item.item_id, item.title, item.author, item.genre, item.isbn, item.publisher, item.year, item.description, item.item_cond, active_auction.current_price from item, active_auction where genre='"+genre+"' and item.item_id=active_auction.item_id order by "+sort+"");
		
		
	    
	    
	    
	    
	    while(rs.next()){ 
	%>
	<br/><br/>
	    <TABLE BORDER="1">
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
	        </TR>
	    </TABLE>
	<% 
	    } 
	%>





		




</body>
</html>