/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clima;

import java.sql.*;

/**
 *
 * @author Devasurya
 */
public class Username {
    static String username=null;
    
    public static void setusername(String us)
    {
        username=us;
    }
    public static String getusername() throws SQLException
    {   
        String type;
            Connection con = JDBCUtils.getConnection();
            String sql="SELECT name FROM user_details where email='"+username+"'";
            Statement stmt = con.createStatement();
            ResultSet rs =stmt.executeQuery(sql);
               rs.next();
        type =rs.getString("name");
        return type;
    }
}
