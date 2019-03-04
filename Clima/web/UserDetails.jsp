<%-- 
    Document   : UserDetails
    Created on : 18 Nov, 2018, 6:34:20 PM
    Author     : Devasurya
--%>
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

		<title>User Details</title>

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
							<li class="menu-item "><a href="UpdateReport.jsp">Update Report</a></li>
                                                        <li class="menu-item current-menu-item"><a href="UserDetails.jsp">User Details</a></li>
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
						<span>User Details</span>
					</div>
			</div>
                <br><br>
                <div class="container">
						<b><font size="5" color="#009999">User Details</font></b>
                           <br><br>

                          <form action="UserDetails.jsp" class="contact-form">
                                    <div class="padding" style="">
                       					<span>
                       						<font style="size: 6; color: #33ccff">
                       							<b>
                       								<font size="5">Username &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font>
                       								</font>
                       					</span>
                                        <input class="text" type="text" name="uname" style="background-color: #009999;width: 20rem;height: 3rem;margin-right: 2rem;">
                       		                  
                                        <br><button type="submit" name="action" value="view" style="margin-left: 19rem;">View</button>
                       							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       							<button type="submit" name="action" value="delete">Delete</button>
                       				</div>
                          </form>
                    </div>
               
                        
                     <% 
                         String action = request.getParameter("action");
                         String uname= request.getParameter("uname");
                         if ("delete".equals(action)){
                         try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();


Connection con = 
         JDBCUtils.getConnection();

       
       PreparedStatement ps = con.prepareStatement("delete from user_details where email=?");
      /// ps.setString(1,coloumn);
                ps.setString(1,uname);
                
                int i=ps.executeUpdate();
                  if(i>0)
{        %><br><p style="margin-left: 28rem;"><b>Deletion for username <%=uname%> Successful</b></p><%
                }
                         }
                         catch(SQLException e)
                         {
                    %><%=e%><%
                        }
}else if ("view".equals(action)) {
 try{ Connection con = 
         JDBCUtils.getConnection();
Statement statement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY) ;

       ResultSet rs1 =statement.executeQuery("select * from user_details a,user_login b where a.email=b.email and a.email='"+uname+"'") ;
       ResultSetMetaData rsmd = rs1.getMetaData();
       int columnsNumber = rsmd.getColumnCount();
if (!rs1.next() ) {
                        %><br><p style="margin-left: 28rem;">
                            <b>Sorry! No User found for username <%=uname%></b> 
                                    </p>
                              <%
                        }
                        else{  rs1.beforeFirst();
       
       
     %>  
       <br>
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
