/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.clima;
import  com.clima.InsertData.*;
import static com.clima.Username.setusername;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Devasurya
 */
@WebServlet(name = "Authentication", urlPatterns = {"/Authentication"})
public class Authentication extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
            PrintWriter out = response.getWriter();
        
            
            
            String email=request.getParameter("email");
            String password = request.getParameter("password");
            if(email.equals("admin@clima.com")&&password.equals("admin123"))
               {
                   request.getRequestDispatcher("/List.jsp").forward(request, response);
               }
            else{ try{
            String type;
            Connection con = JDBCUtils.getConnection();
            String sql="SELECT type FROM user_login where email='"+email+"' and password='"+password+"'";
            Statement stmt = con.createStatement();
            ResultSet rs =stmt.executeQuery(sql);
              boolean cc= rs.next();
               if(!cc)
               {
                    out.println("<script type=\"text/javascript\">");
                    
                    out.println("alert('Username or password is incorrect');");
                    out.println("location='index.html';");
                    out.println("</script>");
               }
               type =rs.getString("type");
            
               
                if(type.equals("Scientist"))
            {   Username.setusername(email);
               request.getRequestDispatcher("/employee.jsp").forward(request, response);
              InsertData ob=new InsertData();
               ob.sendusername(email);
            
            }
            else if(type.equals("Customer"))
            {   Username.setusername(email);
                request.getRequestDispatcher("/customer1.jsp").forward(request, response);
                
            }
            
            
           
             
        } catch (SQLException ex) {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
       // out.println(ex);
        }
        
       
    }
    }
    
}
