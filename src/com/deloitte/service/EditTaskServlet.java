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

import com.deloitte.domain.Task;
import com.deloitte.domain.User;
import com.deloitte.repository.UserRepository;
import com.deloitte.utils.ErrorMsg;

/**
 * Servlet implementation class EditTaskServlet
 */
@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserRepository repo = UserRepository.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditTaskServlet() {
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
		String action = request.getParameter("action");

		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("user");
		Task task = user.getTaskMap().get(Integer.parseInt(taskId));

		if (action.equalsIgnoreCase("update")) {
			session.setAttribute("updateTask", task);
			response.sendRedirect(request.getContextPath() + "/edit-task.jsp");
		}

		if (action.equalsIgnoreCase("remove")) {
			User userByLogin = repo.getUserByLogin(user.getLogin());
			boolean ret = userByLogin.removeTask(Integer.parseInt(taskId));
			response.sendRedirect(request.getContextPath() + "/private/main.jsp");
		}

	}

}
