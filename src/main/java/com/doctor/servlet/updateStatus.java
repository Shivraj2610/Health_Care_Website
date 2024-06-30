package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconn;

/**
 * Servlet implementation class updateStatus
 */
@WebServlet("/updateStatus")
public class updateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateStatus() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			int doctId=Integer.parseInt(request.getParameter("doctId"));
			String comm= request.getParameter("comment");
			
			AppointmentDao dao=new AppointmentDao(DBconn.jdbcConn());
			
			HttpSession session=request.getSession();
			
			if(dao.updateCommentStatus(id, doctId, comm)) {
				session.setAttribute("succMsg", "Comment Update");
				response.sendRedirect("doctor/paitent.jsp");
				
			}else {
				session.setAttribute("errMsg", "Something Wroung on server");
				response.sendRedirect("doctor/paitent.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
