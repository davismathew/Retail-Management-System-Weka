<%--
    Document   : index
    Created on : Oct 28, 2011, 12:19:36 PM
    Author     : daVz
--%>
<%@ page import="com.datamining.*" %>
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
        <title>Behavior Marketing</title>
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
						<h2 class="title"><a href="#">Interesting!!! You have discounts on</a></h2>
						<div class="entry">
                                                    <%
                                String custid=request.getParameter("custid");
System.out.println("The value returned from bill page is : "+custid);

                                                          Statement stmt,stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt7,stmt8;
                                                          int pen=0,pencil=0,coke=0,pepsi=0,laptop=0,mobile=0;
                                                                ResultSet Results,now1=null,now2=null,now3=null,now4=null,now5=null,now6=null,now7=null,now8=null;
                                                                String[] anArray;
                                                                anArray = new String[10];int i=0;
                                                                String billid=null,prodid = null,Id = null,result=null,quantity=null,threshold=null;
                                                                        try {
                                                                             dbconxn cn = new dbconxn();
                                                                             System.out.println("Connection established");
                                                                             String query="select bill_id from transaction where cust_id= '" + custid +"'";;
                                                                             Connection co=cn.makeConnection();
                                                                             stmt=co.createStatement();
                                                                             Results=stmt.executeQuery(query);
                                                                            // stmt.close();

                                                                while(Results.next()){
                                                                    System.out.println("entered");
                                                                    billid=Results.getString(1);
                                                                    System.out.println("bill id "+billid);
                                                                    
                                                                    System.out.println("outside while loop,bill id "+billid);

                                                                    String query1="select qty from billing where bill_id= '" + billid +"' and prod_id='pen'";
                                                                    Connection co1=cn.makeConnection();
                                                                    stmt1=co1.createStatement();
                                                                    now1=stmt1.executeQuery(query1);
                                                                      while(now1.next()){
                                                                            pen=pen+(Integer.parseInt(now1.getString(1)));
                                                                               System.out.println("value of pen :"+pen);
                                                                           }

                                                                    String query2="select qty from billing where bill_id= '" + billid +"' and prod_id='pencil'";
                                                                    Connection co2=cn.makeConnection();
                                                                    stmt2=co2.createStatement();
                                                                    now2=stmt2.executeQuery(query2);
                                                                      while(now2.next()){
                                                                            pencil=pencil+(Integer.parseInt(now2.getString(1)));
                                                                               System.out.println("value of pencil :"+pencil);
                                                                           }

                                                                    String query3="select qty from billing where bill_id= '" + billid +"' and prod_id='coke'";
                                                                    Connection co3=cn.makeConnection();
                                                                    stmt3=co3.createStatement();
                                                                    now3=stmt3.executeQuery(query3);
                                                                    System.out.println("query for coke executed"+now3);

                                                                      while(now3.next()){
                                                                            coke=coke+(Integer.parseInt(now3.getString(1)));
                                                                               System.out.println("value of coke: "+coke);
                                                                           }

                                                                    String query4="select qty from billing where bill_id= '" + billid +"' and prod_id='pepsi'";
                                                                    Connection co4=cn.makeConnection();
                                                                    stmt4=co4.createStatement();
                                                                    now4=stmt4.executeQuery(query4);
                                                                    System.out.println("query for pepsi executed"+now4);

                                                                      while(now4.next()){
                                                                            pepsi=pepsi+(Integer.parseInt(now4.getString(1)));
                                                                               System.out.println("value of pepsi :"+pepsi);
                                                                           }

                                                                    String query5="select qty from billing where bill_id= '" + billid +"' and prod_id='laptop'";
                                                                    Connection co5=cn.makeConnection();
                                                                    stmt5=co5.createStatement();
                                                                    now5=stmt5.executeQuery(query5);
                                                                      while(now5.next()){
                                                                            laptop=laptop+(Integer.parseInt(now5.getString(1)));
                                                                               System.out.println("value of laptop :"+laptop);
                                                                           }

                                                                    String query6="select qty from billing where bill_id= '" + billid +"' and prod_id='mobile'";
                                                                    Connection co6=cn.makeConnection();
                                                                    stmt6=co6.createStatement();
                                                                    now6=stmt6.executeQuery(query6);
                                                                      while(now6.next()){
                                                                            mobile=mobile+(Integer.parseInt(now6.getString(1)));
                                                                               System.out.println("value of mobile:"+mobile);
                                                                           }

                                                              }
                                                                
                                                                        if(pen==0&&pencil==0&&coke==0&&pepsi==0&&laptop==0&&mobile==0)
                                                                        {System.out.println("working and the result is null before prediction");
                                                                        result=null;}
                                                                             else{
                                                                        behavior br=new behavior();
                                                                       result=br.prediction(pen,pencil,coke,pepsi,laptop,mobile);
                                                                       }

                                                                   String query7="select prod_id from product where cat_id= '" + result +"'";
                                                                    Connection co7=cn.makeConnection();
                                                                    stmt7=co7.createStatement();
                                                                    now7=stmt7.executeQuery(query7);
                                                                     while(now7.next()){
                                                                    String pro=now7.getString(1);
                                                                      String query8="select * from discountdetails where prod_id= '" + pro +"'";
                                                                      Connection co8=cn.makeConnection();
                                                                    stmt8=co8.createStatement();
                                                                    now8=stmt8.executeQuery(query8);
                                                                      System.out.println("testing whether working"+now8);

                                                                         while(now8.next())
                                                                        {System.out.println("here the answer is :"+now8.getString(1));
                                                                         %>
                                                                        <table style="background-color: #778899; font-weight: bold; font-size: 13px; text-align: center;" width="300" height="90" cellspacing="1" cellpadding="5" border="1">
                                                                        <tr>
                                                                        <td><FONT COLOR="#FFFFFF"><%= now8.getString(1) %></FONT></td>
                                                                        <td><FONT COLOR="#FFFFFF"><%= now8.getString(2) %></FONT</td>
                                                                        </tr>
                                                                        <% } %></table> 

<%                                                                       }
                                                                         }
                                                                         catch (SQLException e) {
                                                                             e.printStackTrace();
                                                                             System.err.println("Connection Failure");
                                                                         }


%>
                                                    % of the original price

                                                    <p><a href="genbill.jsp?data=<%=custid%>">GENERATE BILL</a></p>

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
