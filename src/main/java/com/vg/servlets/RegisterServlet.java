package com.vg.servlets;

import javax.servlet.http.HttpServlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("sign-up");
		
		System.out.println("email id is "+request.getParameter("emailId"));
		String email_id = request.getParameter("emailId");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String password = request.getParameter("pass");
		String age = request.getParameter("age");
		String gender = request.getParameter("gen");
		String mobile = request.getParameter("mob");
//		String city = request.getParameter("city");
//		String state = request.getParameter("state");
		
		
		try {

			// loading drivers for mysql
			Class.forName("com.mysql.jdbc.Driver");

			// creating connection with the database
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "goku@94251");

			PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?)");

			ps.setString(1, email_id);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, password);
			ps.setString(5, age);
			ps.setString(6, gender);
			ps.setString(7, mobile);
//			ps.setString(8, city);
//			ps.setString(9, state);
			System.out.println("signup is in progress");
			int i = ps.executeUpdate();
			
			
			
			if (i > 0) {
				request.setAttribute("isRegistered", true);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
//				response.sendRedirect("index.jsp");
//				out.println("You are sucessfully registered");
			}

		} catch (Exception se) {
			se.printStackTrace();
		}

	}
}
