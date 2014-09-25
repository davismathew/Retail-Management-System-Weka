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
public class addcat {
  public boolean addcategory(String catname,String catid) throws SQLException {
         Statement stmt;
         ResultSet Results=null;
         String catName = catname,catId = catid;
        try {
             dbconxn cn = new dbconxn();
             System.out.println("Connection established");

            String sql = "INSERT INTO category (cat_name,cat_id) values (?,?)";
            Connection co=cn.makeConnection();
            PreparedStatement pstmt = co.prepareStatement(sql);
              pstmt.setString(1, catName);
              pstmt.setString(2, catId);
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
