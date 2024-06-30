package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Doctor;

import com.dao.DoctorDao;
import com.db.DBconn;

/**
 * Servlet implementation class RegisterDoctor
 */
@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			String fullName=request.getParameter("fullName");
			String qualification=request.getParameter("Qualification"); 
			String email=request.getParameter("email");
			String phoneNumber=request.getParameter("phoneNumber");
			String password=request.getParameter("password");
			String dob=request.getParameter("birthday");
			String specialization=request.getParameter("specialization");
			
			
			Doctor d=new Doctor(fullName,dob,qualification,specialization,email,phoneNumber,password);
			
			DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
			
			boolean f=dao.registerDoctor(d);
			
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Doctor Register Successfuly");
				response.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("errorMsg", "Something wrong on server");
				response.sendRedirect("admin/doctor.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
