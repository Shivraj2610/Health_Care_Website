package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBconn;

/**
 * Servlet implementation class AddSpecialist
 */
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSpecialist() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String specName=request.getParameter("specName");
		
		try {
			SpecialistDao dao = new SpecialistDao(DBconn.jdbcConn());
			
			boolean f=dao.addSpecialist(specName);
			
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Specialist Added");
				response.sendRedirect("admin/adminPage.jsp");
			}else {
				session.setAttribute("errorMsg", "Something wrong on servver");
				response.sendRedirect("admin/adminPage.jsp");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
