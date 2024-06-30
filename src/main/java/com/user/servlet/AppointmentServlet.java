package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconn;
import com.entity.Appointment;

/**
 * Servlet implementation class Appointment
 */
@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @param string 
     * @param docId 
     * @param diseases 
     * @param phNo 
     * @param email 
     * @param appoDate 
     * @param age 
     * @param gender 
     * @param fullName 
     * @param userId 
     * @see HttpServlet#HttpServlet()
     */
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		String fullName=request.getParameter("fullName");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String appoDate=request.getParameter("appoDate");
		String email=request.getParameter("email");
		String phNo=request.getParameter("phNo");
		String diseases=request.getParameter("diseases");
		int docId=Integer.parseInt(request.getParameter("docId"));
		
		
		Appointment ap=new Appointment(userId, fullName,  gender,  age,  appoDate,  email,
				 phNo,  diseases,  docId,  "Pending");
		
		try {
			AppointmentDao dao=new AppointmentDao(DBconn.jdbcConn());
			HttpSession session = request.getSession();
			
			
			if(dao.addAppointment(ap)) {
				session.setAttribute("succMsg", "Appointment Sucessfully");
				response.sendRedirect("user/appoinment.jsp");
			}else {
				session.setAttribute("errMsg", "Something wrong on Server");
				response.sendRedirect("user/appoinment.jsp");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
