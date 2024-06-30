package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	/**
	 * 
	 * The Method for Insert User Data into Database (So User are Register in our Website)
	 */
	public boolean userRegister(User us) {
		boolean f=false;
		
		try {
			
			String sql="insert into user_dtls(name,email,mobile,password) values(?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobile());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User login(String email, String pass) {
		/**
		 * u is null now
		 */
		User u=null;
		
		try {
			
			String query="select * from user_dtls where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				/*
				 * u is contain a object is new User()
				 */
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setMobile(rs.getString(4));
				u.setPassword(rs.getString(5));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
}
