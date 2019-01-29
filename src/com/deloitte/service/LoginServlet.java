package com.deloitte.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.domain.User;
import com.deloitte.repository.UserRepository;
import com.deloitte.utils.ErrorMsg;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserRepository repo = UserRepository.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get the old session and invalidate
		HttpSession oldSession = request.getSession(false);
		if (oldSession != null) {
			oldSession.invalidate();
		}
		// generate a new session
		HttpSession newSession = request.getSession(true);

		String login = request.getParameter("login");
		String password = request.getParameter("password");

		User user = repo.getUserByLogin(login);

		if (isNull(user)) {
			newSession.setAttribute("error", new ErrorMsg("Login and password do not exist, please Sign In !"));
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
			// check login and password
			if (user.getLogin().equals(login) && user.getPassword().equals(password)) {
				// setting session to expiry in 30 mins
				newSession.setMaxInactiveInterval(30 * 60);
				newSession.setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + "/private/main.jsp");
			} else {
				newSession.setAttribute("error", new ErrorMsg("Login and password do not exist, please Sign In !"));
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		}
	}

	private boolean isNull(Object obj) {
		return obj == null;
	}
}
