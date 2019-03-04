



<!DOCTYPE html>


<%@ page import="com.clima.*" %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date" %>

<html lang="en">
<head>
	<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1"> 




	<title>View Page</title>

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
							
							
                                                        <li class="menu-item "><a href="employee.jsp">Insert Report</a></li>
                                                         <li class="menu-item current-menu-item"><a href="customer.jsp">View Reports</a></li>
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
                                               <a href="customer.jsp"><b><%=username%></b></a>
                                        <span>View report</span>
					    </div>
				</div><br>
				<br>
					<h2 class="entry-title">&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;Weather Report</h2><hr width="50%">
						<ul class="colorlib-bubbles">
							<li>&nbsp;&#160;&nbsp;&#160;<b>1) You can view the report on the date and weather station selected</b></li>
							<li>&nbsp;&#160;&nbsp;&#160;<b>2) The weather data includes maximum temperature,minimum temperature,humidity,rainfall and wind speed </b></li>
							<li>&nbsp;&#160;&nbsp;&#160;<b>3) The data which you see are reported by scientists </b></li>
						</ul>
				 <% try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         JDBCUtils.getConnection();

       Statement statement = connection.createStatement() ;

       ResultSet rs =statement.executeQuery("select name from weather_station") ;
%> 
                                        
                                        <br><form action="customer.jsp" method="post" class="contact-form">
						<div style="margin-left: 1rem;" class="row">
									<div class="col-md-6" style="margin-left: .5rem;">
											<h3 class="entry-title"><span><font size="5" color="skyblue"><b> Weather</b> <b>Stations</b>  <b>In</b> India&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;&nbsp;&#160;</font></b></span>
									<br><select name=Station style="background-color:#009999;max-width:100%;">
                                                                                                            <%  while(rs.next()){ %>
                                                                                        <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
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
                                                            <div style="margin-left: 1rem;" class="row"><div class="col-md-3">	
                                                            <input type="date" name="Day">
                                                                </div> </div>
						

						        <div class="row">	
                                                            <button style="margin-left: 1rem;" type="submit" name="action" value="FirstServlet">View Weather</button>
                                                            <button style="margin-left: 1rem; "type="submit" name="action" value="SecondServlet">Check Warning</button>
                                </div>      
                    </form>
                                
                                              
                                
                                
                                
                        <% try{
                            String action = request.getParameter("action");
                        String station=null;
    String date=null;
    String station_id=null;
			int uid=0;
			station= request.getParameter("Station");
                        date= request.getParameter("Day"); 
			
			//String uname=(String)application.getAttribute("uname"); 
			Connection conn=JDBCUtils.getConnection();
                        Statement stmt5=conn.createStatement();
			String strQuery5 = "select station_id from weather_station where name='"+station+"'";
			ResultSet rs3 = stmt5.executeQuery(strQuery5);
                        boolean cc= rs3.next();
                        station_id =rs3.getString("station_id");
     
                        
                        
                        if ("FirstServlet".equals(action)){


//Class.forName("com.mysql.jdbc.Driver");
//String url="jdbc:mysql://localhost/test";
//String username="root";
//String password="root";
    
    
//                        ResultSetMetaData rsmd = rs.getMetaData();
//                        String cuser_id = rsmd.getColumnName(1);
//                         String cemail = rsmd.getColumnName(2);
//                          String cpassword = rsmd.getColumnName(3);
//                           String ctype = rsmd.getColumnName(4);
                    Statement stmt6=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
			String strQuery6 = "select * from weather_report where station_id='"+station_id+"'and report_date=TO_DATE('"+date+"','YYYY-MM-DD')";
                        
			ResultSet rs1 = stmt6.executeQuery(strQuery6);
//ResultSet rs=stmt.executeQuery(query);
                        if (!rs1.next() ) {
                        %><br><p><b><font color="red">
                                <em>&nbsp;Sorry!&nbsp; </em> We don't have any data for <%=station%> on the date <%=date%></b></font>
                                    </p>
                                    <p><font color="#3399ff">
                                      &nbsp;  Please come back later and check again!</font>
                            </p><%
                        }
                        else{  rs1.beforeFirst();                         
while(rs1.next())
{///


%>
<br>
<table border="3px" style="margin-left: 1rem;" >
    <tr style="background-color:white">
        <td style="background-color:#33ccff"><b> <font color="black">Maximum Temperature</font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black">Minimum Temperature</font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black">Humidity</font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black">Wind Speed</font></b></td>
        <td style="background-color:#33ccff"><b> <font color="black">Rainfall</font></b></td>
</tr>
  
<td><b><%=rs1.getInt("max_temp") %></b></td>
<td><b><%=rs1.getInt("min_temp") %></b></td>
<td><b><%=rs1.getInt("humidity") %></b></td>
    <td><b><%=rs1.getInt("wind_speed") %></b></td>
     <td><b><%=rs1.getInt("rainfall") %></b></td>
    </tr>  
    <%

}
}
%>
</table>
    
    <%
    
    }
//catch(Exception e)
//{  
//    e.printStackTrace();
//    }



        else if ("SecondServlet".equals(action)) {

 /*String station=null;
    String date=null;
    String station_id=null;
			int uid=0;
			station= request.getParameter("Station");
                        date= request.getParameter("Day"); 
			
			//String uname=(String)application.getAttribute("uname"); 
			Connection conn=JDBCUtils.getConnection();
                        Statement stmt5=conn.createStatement();
			String strQuery5 = "select station_id from weather_station where name='"+station+"'";
			ResultSet rs = stmt5.executeQuery(strQuery5);
                        boolean cc= rs.next();
                        station_id =rs.getString("station_id"); */
                        String strQuery6 = "{call warning(?,TO_DATE(?,'yyyy/mm/dd'))}";
    
                        CallableStatement cStmt = conn.prepareCall(strQuery6);
                        cStmt.setString(1,station_id);
                        cStmt.setString(2,date);
                        cStmt.execute();

                         Connection con = JDBCUtils.getConnection();
                String sql="SELECT * FROM weather_warning";
              Statement  stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs2 =stmt.executeQuery(sql);
                 rs2.last();
               String max_temp= rs2.getString(2);
                String min_temp= rs2.getString(3);
                String wind_speed= rs2.getString(4);
                String rainfall= rs2.getString(5);
            if(max_temp!=null)
{%> <p style="margin-left: 1rem;"><br><font color="red">Warning!!! Dangerous level of Temperature</font></p> <p style="margin-left: 1rem;"><font size="4"> Can lead to heatstroke</font></p><%}
                if(min_temp!=null)
{%> <p style="margin-left: 1rem;"><br><font color="red"> Warning!!! Dangerous level of Temperature</font></p><p style="margin-left: 1rem;"><font size="4"> Can lead to Frostbite</font></p><%}
           if(wind_speed!=null)
{%> <p style="margin-left: 1rem;"><br><font color="red">Warning!!! Dangerous level of Wind Speed</font></p>
<p style="margin-left: 1rem;"><font size="4"> Cyclone can occur</font></p><%}
            if(rainfall!=null)
{%> <p style="margin-left: 1rem;"><br><font color="red">Warning!!! Dangerous level of Rainfall</font></p><p style="margin-left: 1rem;"><font size="4">  Flood can occur</font></p><%}
            if(max_temp==null&&min_temp==null&&wind_speed==null&&rainfall==null)
            {
%><p style="margin-left: 1rem;"><br>No Warnings</p><%
            }
   
        }
}

catch(Exception e)
{  
    e.printStackTrace();
}



%>
<br>
       <footer class="site-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<form action="#" class="subscribe-form">
								<input type="text" placeholder="Enter your email to subscribe...">
								<input type="submit" value="Subscribe">
							</form>
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
				</div>
			</footer> <!-- .site-footer -->                         
                                
                                
                                
		       
                                
		       
</body>
</html>