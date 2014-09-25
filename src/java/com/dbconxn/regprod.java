/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dbconxn;

/**
 *
 * @author daVz
 */

import java.sql.*;

public class regprod {

     public boolean regproduct(String prodname,String prodid,String catid,String threshold,String price) throws SQLException {
         Statement stmt;
         ResultSet Results=null;
         String prodName = prodname,prodId = prodid,catId=catid,Threshold=threshold,Price=price;
         int thresh = Integer.parseInt(Threshold);int pric=Integer.parseInt(Price);
        try {
             dbconxn cn = new dbconxn();
             System.out.println("Connection established");
      
            String sql = "INSERT INTO product (prod_name,prod_id,cat_id,threshold,price) values (?,?,?,?,?)";
            Connection co=cn.makeConnection();
            PreparedStatement pstmt = co.prepareStatement(sql);
              pstmt.setString(1, prodName);
              pstmt.setString(2, prodId);
              pstmt.setString(3, catId);
              pstmt.setInt(4, thresh);
              pstmt.setInt(5,pric);
//  int numRowsChanged = pstmt.executeUpdate();
         //    stmt=co.createStatement();

             pstmt.executeUpdate();

            }
             catch (SQLException e) {
             e.printStackTrace();
             System.err.println("Connection Failure");
             }
         return true;
        }


}
