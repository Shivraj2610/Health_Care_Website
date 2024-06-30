package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection con;

	public AppointmentDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addAppointment(Appointment ap) {
		boolean f=false;
		
		try {
			String sql="insert into appointment(userId, fullName, gender, age, appointmentDate, email, phNo, diseases, docId, status) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoinDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDocId());
			ps.setString(10, ap.getStatus());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public List<Appointment> getAllAppointmentByLoginUser(int userId){
		List<Appointment> list=new ArrayList<Appointment>();
		Appointment ap=null;
		
		try {
			String sql="select * from appointment where userId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDocId(rs.getInt(10));
				ap.setStatus(rs.getString(11));
				
				list.add(ap);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	public List<Appointment> getAllAppointmentByLoginDoctor(int docId){
		List<Appointment> list=new ArrayList<Appointment>();
		Appointment ap=null;
		
		try {
			String sql="select * from appointment where docId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, docId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDocId(rs.getInt(10));
				ap.setStatus(rs.getString(11));
				
				list.add(ap);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Appointment getAppointmentById(int id){
		
		Appointment ap=null;
		
		try {
			String sql="select * from appointment where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDocId(rs.getInt(10));
				ap.setStatus(rs.getString(11));
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ap;
	}
	
	
	public boolean updateCommentStatus(int id, int docId, String comm) {
		boolean f=false;
		
		try {
			String sql="update appointment set status=? where id=? and docId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, docId);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	public List<Appointment> getAllAppointment(){
		List<Appointment> list=new ArrayList<Appointment>();
		Appointment ap=null;
		
		try {
			String sql="select * from appointment order by id desc";
			PreparedStatement ps=con.prepareStatement(sql);
			
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDocId(rs.getInt(10));
				ap.setStatus(rs.getString(11));
				
				list.add(ap);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}