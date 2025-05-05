package com.iBuy.controller.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iBuy.controller.dao.UserDAO;
import com.iBuy.model.User;

/**
 * Servlet implementation class LogInController
 */
@WebServlet("/LogInController")
public class LogInController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DASHBOARD_PAGE = "/pages/adminDashboard.jsp";
    private static final String INDEX_PAGE = "/pages/index.jsp";
    private static final String LOGIN_PAGE = "/pages/login.jsp";
    private static final String USER_SESSION_ATTR = "userWithSession";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String emailToCheck = request.getParameter("email");
        String passwordToCheck = request.getParameter("password");

        // Validate input
        if (emailToCheck == null || emailToCheck.trim().isEmpty() || 
            passwordToCheck == null || passwordToCheck.trim().isEmpty()) {
            setErrorMessageAndRedirect(request, response, "Email and password are required");
            return;
        }

        try {
            UserDAO userdao = new UserDAO();
            User user = userdao.login(emailToCheck, passwordToCheck);

            if (user == null) {
                setErrorMessageAndRedirect(request, response, "Invalid email or password");
                return;
            }

            // Create a session for the logged-in user
            HttpSession session = request.getSession();
            session.setAttribute(USER_SESSION_ATTR, user);
            session.setMaxInactiveInterval(60 * 60); // 1 hour session timeout

            // Redirect based on user role
            redirectBasedOnRole(user.getRole(), request, response);

        } catch (ClassNotFoundException | SQLException e) {
            // Log the error properly in production (use a logger)
            e.printStackTrace(); // For debugging purposes
            setErrorMessageAndRedirect(request, response, "A system error occurred. Please try again later.");
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    private void redirectBasedOnRole(String role, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if ("admin".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + DASHBOARD_PAGE);
        } else if ("customer".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + INDEX_PAGE);
        } else {
            setErrorMessageAndRedirect(request, response, "User  role not recognized");
        }
    }

    private void setErrorMessageAndRedirect(HttpServletRequest request, HttpServletResponse response, String errorMessage) throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
    }
}