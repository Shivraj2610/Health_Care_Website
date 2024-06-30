package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconn {
	public static Connection jdbcConn() throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url="jdbc:mysql:///docapp";
		String user="root";
		String password="#Shivraj17#";
		
		Connection conn=DriverManager.getConnection(url,user,password);
		
		return conn;
	}
}
