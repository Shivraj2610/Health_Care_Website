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


@WebServlet("/user_register")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserRegister() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String mobile=request.getParameter("mobile");
			String password=request.getParameter("password");
			
			
			
			User u=new User(name,email,mobile,password);
			
			UserDao dao=new UserDao(DBconn.jdbcConn());
			
			HttpSession session = request.getSession();
			
			boolean f=dao.userRegister(u);
			
			if(f) {
				
				session.setAttribute("suc", "Register Sucessfully");
				response.sendRedirect("user_signup.jsp");
			}
			else {
				session.setAttribute("fail", "Something went wrong");
				response.sendRedirect("user_signup.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
