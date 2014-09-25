/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dbconxn;

import java.sql.*;

/**
 *
 * @author daVz
 */
public class addstock {
     public boolean addStock(String prodid,String qty) throws SQLException {
         Statement stmt;
         ResultSet Results=null;
         String prodId = prodid,Qty=qty;
         int quantity = Integer.parseInt(Qty);
        try {
             dbconxn cn = new dbconxn();
             System.out.println("Connection established");

            String sql = "INSERT INTO stock (prod_id,qty) values (?,?)";
            Connection co=cn.makeConnection();
            PreparedStatement pstmt = co.prepareStatement(sql);
              pstmt.setString(1, prodId);
              pstmt.setInt(2, quantity);
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
