<%@page import="com.clima.Username"%>
<%@ page import="com.clima.*" %>
<%@page import=" java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1"> 




	<title>Insert Report</title>

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
							<h1 class="site-title">Clima</h1>
							<small class="site-description">know your climate</small>
						</div>
					</a>

					<!-- Default snippet for navigation -->
				<div class="main-navigation">
						<button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
						<ul class="menu">
							
							<li class="menu-item current-menu-item"><a href="employee.html">Insert Report</a></li>
                                                         <li class="menu-item"><a href="customer.jsp">View Reports</a></li>
                                                      <li class="menu-item"><a href="index.html">Log out</a></li>
						</ul> <!-- .menu -->
					</div> <!-- .main-navigation -->
				</div>
			</div> <!-- .site-header -->
        <% String username = null;
                        username= Username.getusername(); %>
					<main class="main-content">
			 		<div class="container">
					   <div class="breadcrumb">
                                               <a href="employee.jsp"><b><%=username%></b></a>
					<span>Insert Report</span>
					    </div>
				</div><br>
				<br>
                              
					<h2 class="entry-title">&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;Enter new weather report details below</h2><hr width="50%">
						<ul class="colorlib-bubbles">
							<li>&nbsp;&#160;&nbsp;&#160;<b>1) Select your respective station name</b></li>
							<li>&nbsp;&#160;&nbsp;&#160;<b>2) Select the date to which you wish to enter data</b></li>
							<li>&nbsp;&#160;&nbsp;&#160;<b>3) All fields are mandatory</b></li>
						</ul>
                                                <% try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         JDBCUtils.getConnection();

       Statement statement = connection.createStatement() ;

       ResultSet rs =statement.executeQuery("select name from weather_station") ;
%> 
                                        
                                        
                                        
                                        
				<br><form action="http://localhost:8084/Clima/InsertData" class="contact-form" method="post">
						<div class="row">
									<div class="col-md-12">
											<h3 class="entry-title"><span><font size="5" color="skyblue"><b> Select your Station&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;</font></b></span>
									<select name=Station style="background-color:#009999;max-width:20%;">
              <%  while(rs.next())
              {	%>
                <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%>
                </option>
                    <% } %>
						 	</select></h3></div></div>
						 	
                                    			
                               
                                                    <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
                                                    
                                                <div class="row">  <div class="col-md-6">  <input type="date" name="Day"></div>
                                                </div>
						
						
                                                <div class="row">
								<div class="col-md-6"><input type="text" placeholder="Maximum Temprature" name = "MaxTemp">
                                                </div></div>
                                                   <div class="row">
									<div class="col-md-6"><input type="text" placeholder="Minimum Temprature" name="MinTemp"></div>			
						</div>
						<div class="row">
									<div class="col-md-6"><input type="text" placeholder="Humidity" name="Humidity"></div>			
						</div>
						<div class="row">
									<div class="col-md-6"><input type="text" placeholder="Rainfall" name="Rainfall"></div>			
						</div>
						<div class="row">
									<div class="col-md-6"><input type="text" placeholder="Wind Speed" name="WindSpeed"></div>			
						</div>
							
						
						          <div class="row">	
                                        <button style="margin-left: 47rem;" type="submit" name="action" >Insert Data</button>
                        </div>      
                               </form>			
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