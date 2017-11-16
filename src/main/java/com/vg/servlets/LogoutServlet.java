package com.vg.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		Cookie loginCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("JSESSIONID")) {
					System.out.println("JSESSIONID=" + cookie.getValue());
					// break;
				}
				if (cookie.getName().equals("user")) {
					System.out.println("User=" + cookie.getValue());
					loginCookie = cookie;
				}
			}
		}
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}

		// invalidate the session if exists
		HttpSession session = request.getSession(false);
		System.out.println("User=" + session.getAttribute("user"));
		if (session != null) {
			session.invalidate();
		}
		response.sendRedirect("index.jsp");
	}

}
