/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dbconxn;

/**
 *
 * @author daVz
 */
import com.mysql.jdbc.Driver;
import java.sql.*;

public class dbconxn {
    public dbconxn() throws SQLException{
        makeConnection();
    }

    public Connection con;

     public  Connection makeConnection() throws SQLException {
        if (con == null) {
             new Driver();
            // buat koneksi
             con = DriverManager.getConnection(
                       "jdbc:mysql://localhost/rms",
                       "root",
                       "davis");
         }
         return con;
     }
}

