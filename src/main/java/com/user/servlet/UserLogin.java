package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconn;
import com.entity.User;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/userlogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			HttpSession session = request.getSession();
			
			UserDao dao=new UserDao(DBconn.jdbcConn());
			User user=dao.login(email, password);
			
			if(user!=null) {
				session.setAttribute("userObj", user);
				response.sendRedirect("user/index.jsp");
			}else {
				session.setAttribute("error", "Invalid email or password");
				response.sendRedirect("Login/user_login.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
