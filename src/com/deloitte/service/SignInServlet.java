package com.deloitte.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deloitte.repository.UserRepository;
import com.deloitte.utils.ErrorMsg;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserRepository repo = UserRepository.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
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
		
		String name = request.getParameter("name");
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		/*
		System.out.println(" Name    : " + name);
		System.out.println(" login   : " + login);
		System.out.println(" password: " + password);
		*/
		if(name.length() < 10 && login.length() < 4 && password.length() < 4) {
			request.setAttribute("error", new ErrorMsg("Minimum length of each field:/t Name more than 10 characters;/t Login and Password more than 4 characters."));
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); 
			rd.forward(request, response);
			
			// response.sendRedirect("sign_in.jsp");
		}else {
			repo.creareUser(name, login, password);
			response.sendRedirect("login.jsp");
		}

	}

}
