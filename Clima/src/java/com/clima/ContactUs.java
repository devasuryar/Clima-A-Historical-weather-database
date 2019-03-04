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
@WebServlet(name = "ContactUs", urlPatterns = {"/ContactUs"})
public class ContactUs extends HttpServlet {

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
        String name=request.getParameter("uname");
        //String address=request.getParameter("UAddress");
        String email=request.getParameter("email");
        String cname=request.getParameter("cname");
        String website = request.getParameter("website");
        String message=request.getParameter("message");
        try{  
            try (

                    Connection con = JDBCUtils.getConnection(); PreparedStatement ps = con.prepareStatement("insert into contact_us values(?,?,?,?,?)"
                    )) {
                
                ps.setString(1,name);
                ps.setString(2,email);
                ps.setString(3,cname);
                ps.setString(4,website);
               
                //ps.setString(5,email);
                ps.setString(5,message);
               // ps.setString(7,type);
                
                int i=ps.executeUpdate();
                if(i>0)
              {                  out.println("<script type=\"text/javascript\">");
               
                out.println("alert('Your query has been noted"
                        + " We will get back to you as soon as possiblie');");
                 out.println("location='index.html';");
                out.println("</script>");
               
                }
                
            }
        }catch (SQLException e2) {
            
           out.println("<script type=\"text/javascript\">");
           
          out.println("alert('Oops somthing went wrong"
                  + "  Please try again');");
           out.println("location='contact.html';");
           out.println("</script>");
           
 
        }
}
}
    
}
