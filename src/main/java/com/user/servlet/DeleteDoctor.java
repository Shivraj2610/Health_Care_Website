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

/**
 * Servlet implementation class DeleteDoctor
 */
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		
		try {
			DoctorDao dao=new DoctorDao(DBconn.jdbcConn());
			
			HttpSession session=request.getSession();
			
			if(dao.deleteDoctor(id)) {
				session.setAttribute("succ", "Successfuly Deletion");
				response.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("err", "Some Wrong on Server");
				response.sendRedirect("admin/doctor.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


}
