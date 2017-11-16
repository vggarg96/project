package com.vg.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vg.dao.LoginDao;

public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String n = request.getParameter("username");
		String p = request.getParameter("userpass");

		if (LoginDao.validate(n, p)) {

			HttpSession session = request.getSession();
			session.setAttribute("user", n);
			//setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30*60);
			
			Cookie loginCookie = new Cookie("user", n);
			// setting cookie to expiry in 30 mins
			loginCookie.setMaxAge(30 * 60);
			response.addCookie(loginCookie);

			RequestDispatcher rd = request.getRequestDispatcher("welcomeServlet");
			rd.forward(request, response);
		} else {
			out.print("Sorry username or password error");
			// RequestDispatcher rd =
			// request.getRequestDispatcher("registerServlet");

			request.setAttribute("isNotRegistered", true);

			request.getRequestDispatcher("/register.jsp").forward(request, response);

			// rd.include(request, response);
		}

		out.close();
	}

}
