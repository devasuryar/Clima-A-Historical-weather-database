/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clima;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.jdbc.pool.jmx.ConnectionPool;

/**
 *
 * @author Devasurya
 */

public class Register extends HttpServlet {  

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
   
        response.setContentType("text/html");
    try(PrintWriter out = response.getWriter()) {
        String name=request.getParameter("UName");
        String address=request.getParameter("UAddress");
        String email=request.getParameter("UEmail");
        String phoneno=request.getParameter("UPhoneNo");
        String password = request.getParameter("UPassword");
        String type=request.getParameter("UType");
        try{  
            try (

                    Connection con = JDBCUtils.getConnection(); PreparedStatement ps = con.prepareStatement("INSERT ALL INTO user_details VALUES (?,?,?,?) INTO user_login VALUES (?,?,?) SELECT * FROM dual"
                    )) {
                
                ps.setString(1,name);
                ps.setString(2,email);
                ps.setString(3,address);
                ps.setString(4,phoneno);
               
                ps.setString(5,email);
                ps.setString(6,password);
                ps.setString(7,type);
                
                int i=ps.executeUpdate();
                if(i>0)
              {                  out.println("<script type=\"text/javascript\">");
               
                out.println("alert('Registration successfull"
                        + " Please Log into Continue');");
                 out.println("location='index.html';");
                out.println("</script>");
               
                }
                
            }
        }catch (SQLException e2) {
            
           out.println("<script type=\"text/javascript\">");
           
          out.println("alert('Registration Failed"
                  + "  Please try again');");
           out.println("location='signup.html';");
           out.println("</script>");
           
 
        }
}
}
    
}

