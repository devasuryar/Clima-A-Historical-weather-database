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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "InsertData", urlPatterns = {"/InsertData"})
public class InsertData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
 static String rusername;
  public void sendusername(String username)
  {
      rusername=username;
  }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
   
        response.setContentType("text/html");
    try(PrintWriter out = response.getWriter()) {
        String station=request.getParameter("Station");
        String day=request.getParameter("Day");
        String maxtemp=request.getParameter("MaxTemp");
        String mintemp=request.getParameter("MinTemp");
        String humidity = request.getParameter("Humidity");
        String rainfall=request.getParameter("Rainfall");
        String windspeed=request.getParameter("WindSpeed");
        String station_id=null;
//        out.println(station);
//        out.println(day);
//        out.println(maxtemp);
//        out.println(mintemp);
//        out.println(humidity);
//        out.println(rainfall);
//        out.println(windspeed);
        //out.println(station);
       try{  Statement stmt;
            try (Connection con = JDBCUtils.getConnection()) {
                String sql="SELECT * FROM weather_station where name='"+station+"'";
                stmt = con.createStatement();
                ResultSet rs =stmt.executeQuery(sql);
                boolean cc= rs.next();
                station_id =rs.getString("station_id");
                //out.println(station_id);
            }
       stmt.close();
       
       }
       catch(SQLException e)
       {
           out.println(e);
       }
   try{  
            try (///Class.forName("oracle.jdbc.OracleDriver");
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","qwerty");
                    Connection con = JDBCUtils.getConnection(); 
                    PreparedStatement ps = con.prepareStatement("insert into weather_report values(report_seq.nextval,?,TO_DATE(?,'YYYY-MM-DD'),?,?,?,?,?)"
                    )) {
                // ps.setString(1,"509");
                ps.setString(1,station_id);
                ps.setString(2,day);
                ps.setString(3,maxtemp);
                ps.setString(4,mintemp);
                //ps.setString(6,"509");
                ps.setString(5,humidity);
                ps.setString(6,windspeed);
                ps.setString(7,rainfall);
                
                int i=ps.executeUpdate();
                if(i>0)
              {                  out.println("<script type=\"text/javascript\">");
               
                out.println("alert('Insertion successfull"
                        + " Click for continuing insertion');");
                 out.println("location='employee.jsp';");
                out.println("</script>");
                //out.println("asdsadas");
                }
//                else
//                {
//                    out.println("<script type=\"text/javascript\">");
//                    
//                    out.println("alert('Registration Failed"
//                            + "Please try again');");
//                    out.println("location='signup.html';");
//                    out.println("</script>");
//                }
            }
        }catch (SQLException e2) {
            
           out.println("<script type=\"text/javascript\">");
           
          out.println("alert('Insertion Failed"
                  + "  Please check the data and try again');");
           out.println("location='employee.jsp';");
           out.println("</script>");
           
           
}
}
  try {
                //  out.println(e2);
                logupdate(rusername);
            } catch (SQLException ex) {
                Logger.getLogger(InsertData.class.getName()).log(Level.SEVERE, null, ex);
            } 
}
public void logupdate(String username) throws SQLException
    {    String station_id=null;
         String  report_id=null;
        try{  Statement stmt;
            try (Connection con = JDBCUtils.getConnection()) {
                String sql="SELECT * FROM weather_report";
                stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs =stmt.executeQuery(sql);
                 rs.last();
                //rs.previous();
                
                 station_id = rs.getString("station_id");
                report_id= rs.getString("report_id");
            }
       stmt.close();
       
       }
       catch(SQLException e)
       {
           System.out.println(e);
       }
        
        
        
   
        
        
        try (///Class.forName("oracle.jdbc.OracleDriver");
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","qwerty");
                    Connection con = JDBCUtils.getConnection(); 
                    PreparedStatement ps = con.prepareStatement("insert into log values(?,sysdate,?,?)"
                    )) {
                // ps.setString(1,"509");
                ps.setString(1,username);
                ps.setString(2,station_id);
                ps.setString(3,report_id);
                int i=ps.executeUpdate();
    
    }


   
}
}
