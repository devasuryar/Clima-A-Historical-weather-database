package com.clima;


import java.sql.*;
//import static bean.Provider.*;

public class ConnectionProvider {
	static Connection con=null;
	static{
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","qwerty");
			}catch(ClassNotFoundException | SQLException e){}
	}
	public static Connection getCon(){
		return con;
	}
}
