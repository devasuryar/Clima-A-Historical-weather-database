<%-- 
    Document   : List
    Created on : 17 Nov, 2018, 1:36:37 AM
    Author     : Devasurya
--%>
<%@ page import="com.clima.*" %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>List ALL</title>

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
							
							<li class="menu-item current-menu-item"><a href="List.jsp">List</a></li>
							<li class="menu-item"><a href="UpdateReport.jsp">Update Report</a></li>
                                                        <li class="menu-item"><a href="UserDetails.jsp">User Details</a></li>
                                                        <li class="menu-item"><a href="weatherstation.html">Add Station</a></li>
                                                        <li class="menu-item"><a href="index.html">Log out</a></li>
						</ul> <!-- .menu -->
					</div>

					<!-- Default snippet for navigation -->

				</div>
			</div> <!-- .site-header -->

			<main class="main-content">
				<div class="container">
					<div class="breadcrumb">
						<span>Tables List</span>
					</div>
				</div>
                <br><br>
					<div class="container">
						<b><font size="5" color="#009999">Name of Tables</font></b>
                           <br><br>
					           <form action="List.jsp" method="post" class="contact-form">
                                    <div class="col-md-6">
                       					<select name="tables" style="background-color: #009999; max-width: 100%">
                       		                   <option value="user_details">User Details</option>
                       		                   <option value="user_login">Login Details </option>
                       		                   <option value="weather_station">Weather Stations</option>
                       		                   <option value="weather_report">Weather Report</option>
                                                   <option value="log">Insertion Log</option>
                                                   <option value="contact_us">Contact Us</option>
                                                   <option value="deleted_users">Retired Users</option>
                       					</select>
                       						<button type="submit" class="login" value="update" >List</button>
                      				</div>
                    		   </form>
                    </div>
                
                
                <% try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
String name= request.getParameter("tables");
Connection connection = 
         JDBCUtils.getConnection();

       Statement statement = connection.createStatement() ;

       ResultSet rs1 =statement.executeQuery("select * from "+name+"") ;
       ResultSetMetaData rsmd = rs1.getMetaData();
       int columnsNumber = rsmd.getColumnCount();

       
       
     %>  
       <br>
       <p style="margin-left: 16rem;"><b><%=name%></b><p>
       
<table border="3px" style="margin-left: 16rem;" >
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
    connection.close();
    }
catch(Exception e)
{  
    e.printStackTrace();
    }





                %> 
                   
			 
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