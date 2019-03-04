/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clima;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Devasurya
 */
@WebServlet(name = "AddStation", urlPatterns = {"/AddStation"})
public class AddStation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
   public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
   
        response.setContentType("text/html");
    try(PrintWriter out = response.getWriter()) {
        String Name=request.getParameter("Name");
        //String address=request.getParameter("UAddress");
        String Location=request.getParameter("Location");
        
        try{  
            try (

                    Connection con = JDBCUtils.getConnection(); PreparedStatement ps = con.prepareStatement("insert into weather_station values(station_seq.nextval,?,?,sysdate)"
                    )) {
                
                ps.setString(1,Name);
                ps.setString(2,Location);
               
                
                int i=ps.executeUpdate();
                if(i>0)
              {                  out.println("<script type=\"text/javascript\">");
               
                out.println("alert('New Station added Successfully');");
                 out.println("location='weatherstation.html';");
                out.println("</script>");
               
                }
                
            }
        }catch (SQLException e2) {
            
           out.println("<script type=\"text/javascript\">");
           
          out.println("alert('Oops somthing went wrong"
                  + "  Please try again');");
           out.println("location='weatherstation.html';");
           out.println("</script>");
           
 
        }
}
}}
