package com.iBuy.controller.servelet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iBuy.controller.dao.UserDAO;
import com.iBuy.model.User;

/**
 * Servlet implementation class UserManagementController
 */
@WebServlet("/UserManagementController")
public class UserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementController() {
        super();
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userWithSession") == null) {
			response.sendRedirect(request.getContextPath()+ "pages/login.jsp");
			return;
		}
		User loggedUser = (User) session.getAttribute("userWithSession");
		if (!"admin".equalsIgnoreCase(loggedUser.getRole())) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }
		
		String action = request.getParameter("action");
       
		
        try {
        	 UserDAO userDao = new UserDAO();
            if ("create".equalsIgnoreCase(action)) {
                User newUser = new User();
                newUser.setName(request.getParameter("name"));
                newUser.setEmail(request.getParameter("email"));
                newUser.setPassword(request.getParameter("password")); // Consider hashing
                /*newUser.setPhone(request.getParameter("phone"));
                newUser.setAddress(request.getParameter("address"));*/
                newUser.setRole(request.getParameter("role"));

                boolean success = userDao.register(newUser);
                request.setAttribute("message", success ? "User created successfully" : "Failed to create user");
            } else if ("delete".equalsIgnoreCase(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                boolean success = userDao.deleteUser(userId);
                request.setAttribute("message", success ? "User deleted successfully" : "Failed to delete user");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        }
        
     // Reload user list and forward back to dashboard
        try {
        	UserDAO userDao = new UserDAO();
            List<User> userList = userDao.getAllUsers();
            request.setAttribute("userList", userList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load users.");
        }

        request.getRequestDispatcher("/pages/adminDashboard.jsp").forward(request, response);
    
	}

}
