package com.deloitte.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
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
 * Servlet implementation class CadTaskServlet
 */
@WebServlet("/CadTaskServlet")
public class CadTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserRepository repo = UserRepository.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadTaskServlet() {
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
		HttpSession session = request.getSession(false);
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		User user = (User) session.getAttribute("user");

		if (title == null && description == null) {
			response.sendRedirect(request.getContextPath() + "/private/main.jsp");
		} else {

			if (user == null) {
				session.setAttribute("error", new ErrorMsg("Need to login."));
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			} else {
				user.insertTask(title, description);
				response.sendRedirect(request.getContextPath() + "/private/main.jsp");
			}
		}

	}

	public void destroy() {
		System.out.println("CadTaskServlet destroyed!!");
	}

}
