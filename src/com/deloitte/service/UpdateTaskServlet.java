package com.deloitte.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deloitte.domain.User;
import com.deloitte.repository.UserRepository;

/**
 * Servlet implementation class UpdateTaskServlet
 */
@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserRepository repo = UserRepository.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTaskServlet() {
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
		String taskId = request.getParameter("taskId");
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		User userByLogin = repo.getUserByLogin(user.getLogin());

		userByLogin.updateTask(Integer.parseInt(taskId), title, description);

		response.sendRedirect(request.getContextPath() + "/private/main.jsp");

	}

}
