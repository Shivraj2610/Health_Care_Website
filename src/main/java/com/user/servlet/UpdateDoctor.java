package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBconn;
import com.entity.Doctor;


@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullName=request.getParameter("fullName");
		String qualification=request.getParameter("Qualification"); 
		String email=request.getParameter("email");
		String phoneNumber=request.getParameter("phoneNumber");
		String password=request.getParameter("password");
		String dob=request.getParameter("birthday");
		String specialization=request.getParameter("specialization");
		int id=Integer.parseInt(request.getParameter("id"));
		
		try {
			Doctor d=new Doctor(id,fullName,dob,qualification,specialization,email,
					phoneNumber, password);
			
			DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
			
			boolean f=dao.updateDoctor(d);
			
			HttpSession session = request.getSession();
			
			if(f==true) {
				session.setAttribute("success", "Updation Successfuly Done");
				response.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("error", "Some Wrong on Server");
				response.sendRedirect("admin/doctor.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
