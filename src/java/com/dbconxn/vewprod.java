
package com.dbconxn;

/**
 *
 * @author daVz
 */

import java.sql.*;
import java.util.*;
class billing{
String billid;
String prodid;
String qty;
public billing(String bill,String prod,String qnty)
    {
        billid = bill;
        prodid = prod;
        qty = qnty;
    }
}
public class vewprod {

     public static void main(String args[]) {
Statement stmt,stmt1,stmt2;
ResultSet Results,now=null,now1=null;
String[] anArray;
anArray = new String[10];int i=0;
ArrayList<billing> davis=new ArrayList<billing>();
String prodid = null,Id = null,printrow,quantity=null,threshold=null;



try {
             dbconxn cn = new dbconxn();
             System.out.println("Connection established");
             String query="select prod_id from product";
             Connection co=cn.makeConnection();
             stmt=co.createStatement();
             Results=stmt.executeQuery(query);
            // stmt.close();

while(Results.next()){
    System.out.println("entered");
    prodid=Results.getString(1);
    System.out.println("bill id "+prodid);
    String query1="select qty from stock where prod_id= '" + prodid +"'";
             Connection co1=cn.makeConnection();
             stmt1=co1.createStatement();
             now=stmt1.executeQuery(query1);
                 String query2="select threshold from product where prod_id= '" + prodid +"'";
             Connection co2=cn.makeConnection();
             stmt2=co2.createStatement();
             now1=stmt2.executeQuery(query2);
    
              while(now.next()){
                quantity=now.getString(1);
                                System.out.println("inside"+quantity);
            }
             while(now1.next()){
                threshold=now1.getString(1);
                                System.out.println("inside 2nd"+threshold);
            }
                                System.out.println("outside"+quantity+threshold);
                                int quantint = Integer.parseInt(quantity);
                                int threshint= Integer.parseInt(threshold);
        if(quantint>threshint){
            System.out.println("Everything is fine");
        }
 else{ 
anArray[i]=prodid;
i++;
 }

}
             for(i=0;i<10;i++)
             {
                 if(anArray[i]!=null)
                 System.out.println(anArray[i]);
             }


         }
         catch (SQLException e) {
             e.printStackTrace();
             System.err.println("Connection Failure");
         }
        }


}
