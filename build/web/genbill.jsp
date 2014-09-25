<%--
    Document   : Welcome
    Created on : Oct 28, 2011, 12:54:15 PM
    Author     : daVz
--%>
<%@ page import="com.dbconxn.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>JSP Page</title>
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
						<h2 class="title"><a href="#">Welcome to RMS </a></h2>

						<div class="entry">
							<p><img src="images/img07.jpg" width="200" height="200" alt="" class="alignleft border" />
                                    
                                                        <p>   Customer id is ${param.data}</p>
                                <%
Calendar cal = new GregorianCalendar();
  int month = cal.get(Calendar.MONTH)+2;

    System.out.println("I am in the program--------------------");
String check=null; String addcart="addtocart"; String generatebill="generatebill";String customerid=null;
double amount=0;
String prodname=request.getParameter("prodname");
String quant1=request.getParameter("quantity");
String cid=null;
//int test=Integer.parseInt(quant);
check=(request.getParameter("submit"));

System.out.println("results are : "+addcart+prodname+quant1+check);
Statement stmt;
ResultSet Results=null;

                               customerid=request.getParameter("data") ;
                                System.out.println("customer id is : "+customerid);
if(customerid!=null){
    System.out.println("Customer id not equals null");
                                try{
                    dbconxn cnt = new dbconxn();
             System.out.println("Connection established for insertion of row");

            String sqlt = "INSERT INTO temp (custid) values (?)";
            Connection cot=cnt.makeConnection();
            PreparedStatement pstmtt = cot.prepareStatement(sqlt);
              pstmtt.setString(1, customerid);
              
//  int numRowsChanged = pstmt.executeUpdate();
         //    stmt=co.createStatement();
             pstmtt.executeUpdate();
}catch(Exception e){}
}
String customer=request.getParameter("custid");

 try{
 if(check.equals(addcart)){
int quant=Integer.parseInt(quant1);

 System.out.println("here no prob : "+customer);
try{
    try{
        Statement stmtp1;ResultSet Resultsp1;
        dbconxn cnp1 = new dbconxn();
             System.out.println("Connection established");
             String queryp1="select * from temp";
             Connection cop1=cnp1.makeConnection();
             stmtp1=cop1.createStatement();
             Resultsp1=stmtp1.executeQuery(queryp1);
                  while(Resultsp1.next()){

                cid=Resultsp1.getString(1);
                System.out.println("Customer id is : "+cid);
                 }

        Statement stmtp;ResultSet Resultsp;
                 dbconxn cnp = new dbconxn();
             System.out.println("Connection established");
             String queryp="select price from product where prod_id='" + prodname +"'";
             Connection cop=cnp.makeConnection();
             stmtp=cop.createStatement();
             Resultsp=stmtp.executeQuery(queryp);
                  while(Resultsp.next()){
                  
                amount=Resultsp.getInt(1);
                System.out.println("Amount is : "+amount+"and sum total is : "+(amount*quant));
                 }
    }catch(Exception e){e.printStackTrace();}

             dbconxn cn = new dbconxn();
             System.out.println("Connection established for insertion of row");

            String sql = "INSERT INTO bill (prod_id,qty,cutid,amount) values (?,?,?,?)";
            Connection co=cn.makeConnection();
            PreparedStatement pstmt = co.prepareStatement(sql);
              pstmt.setString(1, prodname);
              pstmt.setInt(2, quant);
              pstmt.setString(3, cid);
              pstmt.setDouble(4, amount*quant);
//  int numRowsChanged = pstmt.executeUpdate();
         //    stmt=co.createStatement();
             pstmt.executeUpdate();
 //updating table bill for add to cart

             dbconxn cn2 = new dbconxn();
             System.out.println("Connection established for printing details");
             String query2="select * from bill";
             Connection co2=cn2.makeConnection();
          Statement stmt2=co2.createStatement();
            ResultSet Results2=stmt2.executeQuery(query2);
            // stmt.close();
//retreiving values from table bill for showing the already addd products
%>

<table style="background-color: #778899; font-weight: bold; font-size: 13px; text-align: center;" width="150" height="20" cellspacing="1" cellpadding="1" border="1">
    <tr><td>PRODUCT NAME</td><td>QUANTITY</td><td>AMOUNT</td></tr>
    <% while(Results2.next()){
    System.out.println("entered");
  %>
<tr>
<td><FONT COLOR="#FFFFFF"><%=Results2.getString(1) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results2.getString(2) %></FONT></td>
<td><FONT COLOR="#FFFFFF"><%=Results2.getDouble(4) %></FONT></td></tr>
   <% customerid=Results2.getString(3); }%>
</table>


<%}catch(SQLException e){e.printStackTrace();}
}else if(check.equals(generatebill)){
String billp=null,billc=null,tempbill=null;double totalamount=0,billa=0,billnow=0;int billq=0;
  int count=0;
Calendar currentDate = Calendar.getInstance();
  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-M-dd");
  String dateNow = formatter.format(currentDate.getTime());
    //generate the bill and update the values in the table
    dbconxn cn4 = new dbconxn();
             System.out.println("Connection established for printing details");
             String query4="select * from bill";
             Connection co4=cn4.makeConnection();
          Statement stmt4=co4.createStatement();
            ResultSet Results4=stmt4.executeQuery(query4);
            while(Results4.next()){

            billc=Results4.getString(3);
            billa=Results4.getDouble(4);
            totalamount=totalamount+billa;
                                     }
             dbconxn cntrans = new dbconxn();
            String sqltrans = "INSERT INTO transaction (cust_id,date,bill_amt) values (?,?,?)";
            Connection cotrans=cntrans.makeConnection();
            PreparedStatement pstmttrans = cotrans.prepareStatement(sqltrans);
              pstmttrans.setString(1, billc);
              pstmttrans.setString(2, dateNow);
              pstmttrans.setDouble(3, totalamount);
//  int numRowsChanged = pstmt.executeUpdate();
         //    stmt=co.createStatement();
             pstmttrans.executeUpdate();
// get billid from transaction table
    dbconxn cn5 = new dbconxn();
             System.out.println("Connection established for printing details");
             String query5="select bill_id from transaction order by bill_id desc limit 1";
             Connection co5=cn5.makeConnection();
          Statement stmt5=co5.createStatement();
            ResultSet Results5=stmt5.executeQuery(query5);
            while(Results5.next())
                    {
                tempbill=Results5.getString(1);
            }
//update the billing table with the bill
dbconxn cn9 = new dbconxn();
             System.out.println("Connection established for printing details");
             String query9="select * from bill";
             Connection co9=cn9.makeConnection();
          Statement stmt9=co9.createStatement();
            ResultSet Results9=stmt9.executeQuery(query9);
            while(Results9.next()){
            billp=Results9.getString(1);
            billq=Results9.getInt(2);
            billnow=Results9.getDouble(4);

            dbconxn cnbill = new dbconxn();
            String sqlbill = "INSERT INTO billing (bill_id,prod_id,qty,month,amount) values (?,?,?,?,?)";
            Connection cobill=cnbill.makeConnection();
            PreparedStatement pstmtbill = cobill.prepareStatement(sqlbill);
              pstmtbill.setString(1, tempbill);
              pstmtbill.setString(2, billp);
              pstmtbill.setInt(3, billq);
              pstmtbill.setInt(4, month);
              pstmtbill.setDouble(5, billnow);
              pstmtbill.executeUpdate();
}
//empty the two temporary tables
                      dbconxn cnd = new dbconxn();
             String queryd="delete from bill";
             Connection cod=cnd.makeConnection();
          Statement stmtd=cod.createStatement();
            stmtd.executeUpdate(queryd);

              dbconxn cnd1 = new dbconxn();
             String queryd1="delete from temp";
             Connection cod1=cnd1.makeConnection();
          Statement stmtd1=cod1.createStatement();
            stmtd1.executeUpdate(queryd1);
     //redirect to anew page
            response.sendRedirect("printbill.jsp");
                        }




            }
         catch (Exception e) {
             e.printStackTrace();
             System.err.println("Connection Failure");
         }

 //                             System.out.println("customer id is : "+customerid);



                                
try{                 dbconxn cn = new dbconxn();
             System.out.println("Connection established");
             String query="select prod_id from product";
             Connection co=cn.makeConnection();
             stmt=co.createStatement();
             Results=stmt.executeQuery(query);

    }catch(Exception e){e.printStackTrace();}
%>
<form name="form" action="genbill.jsp" method="POST">
    <table>
      <tr><td><input type="text" disabled="disabled" id="custid" name="custid" value="${param.data}" ></td></tr>

        <tr><td> <select name="prodname" id="prodname">
 <option value="-1">---Select---</option>
<%while(Results.next())
{
 %>
 <option value="<%=Results.getString(1)%>">
        <%=Results.getString(1)%></option>
<%}
   
%>
                </select></td></tr>
       <tr><td><input type="text" name="quantity" ></td></tr>
        <tr><td><input type="Submit" name="submit" value="addtocart"></td></tr>
        <tr><td><input type="Submit" name="submit" value="generatebill"></td></tr>
    </table>
</form>
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
