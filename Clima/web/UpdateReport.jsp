<%@ page import="com.clima.*" %>
<%@page import="java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

		<title>Update Report</title>

		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Loading main css file -->
		<link rel="stylesheet" href="style.css">

		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->

	</head>

	<body>
		<div class="site-content">
			<div class="site-header">
				<div class="container">
					<a href="index.html" class="branding">
						<img src="images/logo.png" alt="" class="logo">
						<div class="logo-type">
							<h1 class="site-title">Clima!!</h1>
							<small class="site-description">know your climate</small>
						</div>
					</a>

					<div class="main-navigation">
						<button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							<li class="menu-item "><a href="List.jsp">List</a></li>
							<li class="menu-item current-menu-item"><a href="UpdateReport.jsp">Update Report</a></li>
                                                        <li class="menu-item"><a href="UserDetails.jsp">User Details</a></li>
                                                        <li class="menu-item"><a href="weatherstation.html">Add Station</a></li>
                                                        <li class="menu-item"><a href="index.html">Log out</a></li>
						</ul> <!-- .menu -->
					</div> <!-- .main-navigation -->

					<!-- Default snippet for navigation -->

				</div>
			</div> <!-- .site-header -->

        <main class="main-content">
			<div class="container">
					<div class="breadcrumb">
						<span>Report Updation</span>
					</div>
			</div>
                <br><br>
               
                
                
                
                

                <div class="container">
						<b><font size="5" color="#009999">Weather Report</font></b>
                           <br><br>
                           <form action="UpdateReport.jsp" method="post" class="contact-form">
                                    <div class="padding" style="">
                       					<span>
                       						<font style="size: 6; color: #33ccff">
                       							<b>
                       								<font size="5">Report id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font>
                       								</font>
                       					</span>
                                        <input class="text" type="text" name="report_id" style="background-color: #009999;width: 20rem;height: 3rem;margin-right: 2rem; margin-left: 3rem;">
                       		                   
                       							 <button type="submit" name="action" value="view">View Report</button>
                                    </div>
                      				
                      				 <div class="padding" style="display: flex;">
                       					<span>
                       						<font style="size: 6; color: #33ccff">
                       							<b>
                       								<font size="5">Column Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font>
                       								</font>
                       					</span>
                       					<select name="coloumn" style="background-color: #009999;width: 20rem;height: 3rem;margin-right: 2rem;">
                       		                   <option value="max_temp">Maximum Temperature</option>
                       		                   <option value="min_temp">Minimum Temperature</option>
                       		                   <option value="wind_speed">Wind Speed</option>
                       		                   <option value="humidity">Humidity</option>
                                                   <option value="rainfall">Rainfall</option>
                       					</select>
                       				</div>
                               <br>
                       					<div class="padding" style="display: flex;">
                       					<span>
                       						<font style="size: 6; color: #33ccff">
                       							<b>
                       								<font size="5">New Value &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font>
                       								</font>
                                                                                <input class="text" type="text" name="newval" style="background-color: #009999; width: 20rem;height: 3rem;margin-right: 2rem;margin-left: 2.6rem;">
                       		                   	
                       					</span>
                       				</div>
                       					<button type="submit" name="action" value="update" style="margin-left: 24rem;">Update Report</button>
                    		   </form>
                           <br>
                    </div>
                         <% String action = request.getParameter("action");
                            String report_id= request.getParameter("report_id"); 
                             if ("update".equals(action)){
                             try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();

String coloumn= request.getParameter("coloumn");
String newval= request.getParameter("newval");
Connection con = 
         JDBCUtils.getConnection();

       
       PreparedStatement ps = con.prepareStatement("update weather_report set "+coloumn+" = ? where report_id=?");
      /// ps.setString(1,coloumn);
                ps.setString(1,newval);
                ps.setString(2,report_id);
                int i=ps.executeUpdate();
                  if(i>0)
{        %><p style="margin-left: 30rem;"><b>Updation for report id <%=report_id%> Successful</b></p><%
                }
                else
{
%><p style="margin-left: 30rem;"><b>No records Found</b><%
}
                         }
                         catch(SQLException e)
                         {
                         System.out.println(e);
%><p style="margin-left: 30rem;"><b>Updation for report id <%=report_id%> Failed</b></p><%
                        }
                        }  else if ("view".equals(action)) {

           try{ Connection con = 
         JDBCUtils.getConnection();
Statement statement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY) ;


       ResultSet rs1 =statement.executeQuery("select * from weather_report where report_id='"+report_id+"'") ;
 if (!rs1.next() ) {
                        %><br><p style="margin-left: 30rem;">
                            <b>Sorry! No reports found for id <%=report_id%></b> 
                                    </p>
                              <%
                        }
                        else{  rs1.beforeFirst();   
       ResultSetMetaData rsmd = rs1.getMetaData();
       int columnsNumber = rsmd.getColumnCount();

       
       
     %>  
       <br>
<table border="3px" style="margin-left: 16rem;">
    <tr style="background-color:white">
        <%for(int i=1;i<=columnsNumber;i++)
        {%>
        <td style="background-color:#33ccff"><b> <font color="black"><%=rsmd.getColumnName(i)%></font></b></td>
        <%}%>
<!--        <td style="background-color:#33ccff"><b> <font color="black"></font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black"></font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black"></font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black"></font></b></td>-->
</tr>
       
       
<%       
       
       while(rs1.next())   
{///


%>

   <%for(int i=1;i<=columnsNumber;i++)
        {%>
<td><b><%=rs1.getString(i) %></b></td>
<%}%>
<!--<td><b></b></td>
<td><b></b></td>
    <td><b></b></td>
     <td><b></b></td>-->
    </tr>  
    <%

}

%>
    </table>
    <%
    rs1.close();
    statement.close();
    con.close();
    }
}
catch(Exception e)
{  
    e.printStackTrace();
    }



                            
}
       
       
     %>  


        </main>
     </div>
      <footer class="site-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							
						</div>
						<div class="col-md-3 col-md-offset-1">
							<div class="social-links">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-google-plus"></i></a>
								<a href="#"><i class="fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>

					<p class="colophon">Copyright 2018 Clima. Designed by Clima. All rights reserved</p>
				
			</footer> <!-- .site-footer -->
        </body>
</html>
    