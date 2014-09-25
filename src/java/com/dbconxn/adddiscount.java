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
public class adddiscount {
     public boolean addDiscount(String prodid,String disc) throws SQLException {
         Statement stmt;
         ResultSet Results=null;
         String prodId = prodid,Disc=disc;
         int discount = Integer.parseInt(disc);
        try {
             dbconxn cn = new dbconxn();
             System.out.println("Connection established");

            String sql = "INSERT INTO stock (prod_id,qty) values (?,?)";
            Connection co=cn.makeConnection();
            PreparedStatement pstmt = co.prepareStatement(sql);
              pstmt.setString(1, prodId);
              pstmt.setInt(2, discount);
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
