<%--
    Document   : Welcome
    Created on : Oct 28, 2011, 12:54:15 PM
    Author     : daVz
--%>
<%@ page import="com.dbconxn.*" %>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Product</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script src="https://www.google.com/jsapi?key=ABQIAAAAl4aARPbxKLjaEl4S3oZRfBQtTzT4QyoJQnFffYiGRf41NAG3QxTx57rXYVqZoHhxTiSK8-0b-JmFFQ" type="text/javascript"></script>
    <script language="Javascript" type="text/javascript">
    //<![CDATA[
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};

    google.load("search", "1");

    function OnLoad() {
      // Create a search control
      var searchControl = new google.search.SearchControl();

      // Add in a full set of searchers
      var localSearch = new google.search.LocalSearch();
      searchControl.addSearcher(localSearch);
      searchControl.addSearcher(new google.search.WebSearch());
      searchControl.addSearcher(new google.search.VideoSearch());
      searchControl.addSearcher(new google.search.BlogSearch());

      // Set the Local Search center point
      localSearch.setCenterPoint("New York, NY");

      // Tell the searcher to draw itself and tell it where to attach
      searchControl.draw(document.getElementById("searchcontrol"));

      // Execute an inital search
      searchControl.execute("Google");
    }
    google.setOnLoadCallback(OnLoad);

    //]]>
    </script>
</head>
<body>
    <div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<h1><a href="#">Retail Management System </a></h1>
			</div>
		</div>
	</div>
	<!-- end #header -->
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="Home.jsp">Home</a></li>
			<li><a href="product.jsp">Product</a></li>
			<li><a href="category.jsp">Category</a></li>
			<li><a href="stock.jsp">Stock</a></li>
			<li><a href="bill.jsp">Bill</a></li>
			<li><a href="customertransaction.jsp">Customer Transaction</a></li>
		</ul>
	</div>
	<!-- end #menu -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="content">
					<div class="post">
						<h2 class="title"><a href="#">Print Bill </a></h2>

						<div class="entry">
							<p><img src="images/img07.jpg" width="200" height="200" alt="" class="alignleft border" />
                                                        <% String billid=null; try{
      dbconxn cn = new dbconxn();
  System.out.println("Connection established for printing details");
   String query="select * from transaction order by bill_id desc limit 1";
               Connection co=cn.makeConnection();
                Statement stmt=co.createStatement();
                  ResultSet Results=stmt.executeQuery(query);
                                                         %>
<table style="background-color: #778899; font-weight: bold; font-size: 13px; text-align: center;" width="150" height="20" cellspacing="1" cellpadding="1" border="1">
<tr><td>CUSTOMER ID</td><td>BILL ID</td><td>DATE</td><td>TOTAL AMOUNT</td></tr>
    <% while(Results.next()){
    System.out.println("entered");
billid=Results.getString(2);
  %>
<tr>
<td><FONT COLOR="#FFFFFF"><%=Results.getString(1) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results.getString(2) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results.getString(3) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results.getDouble(4) %></FONT></td></tr>
<%}
           }catch(Exception e){}
  %>

</table>

   <% try{
dbconxn cn1 = new dbconxn();
  System.out.println("Connection established for printing details");
   String query1="select * from billing where bill_id='" + billid +"'";
               Connection co1=cn1.makeConnection();
                Statement stmt1=co1.createStatement();
                  ResultSet Results1=stmt1.executeQuery(query1);
                                                         %>
<table style="background-color: #778899; font-weight: bold; font-size: 13px; text-align: center;" width="150" height="20" cellspacing="1" cellpadding="1" border="1">
<tr><td>BILL ID</td><td>PROD ID</td><td>QUANTITY</td><td>AMOUNT</td></tr>
    <% while(Results1.next()){
    System.out.println("entered");
  %>
<tr>
<td><FONT COLOR="#FFFFFF"><%=Results1.getString(1) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results1.getString(2) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results1.getString(3) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results1.getDouble(6) %></FONT></td></tr>
<%} 
   }catch(Exception e){}%>
</table>
                                                </div>
					</div>
					<div style="clear: both;">&nbsp;</div>
				</div>
				<!-- end #content -->
                                <div id="sidebar">
					<ul>
						<li>
                                                      <div id="searchcontrol">Loading...</div>

						</li>
					</ul>
				</div>

				<!-- end #sidebar -->
				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>
	</div>
	<!-- end #page -->
</div>
<div id="footer-wrapper">
	<div id="footer">
		<p>Copyright (c) 2011 RMS.com. All rights reserved. Design by <a href="http://www.google.co.in/">Davis--for RMS Application </a>.</p>
	</div>
</div>
<!-- end #footer -->
</body>

</html>
