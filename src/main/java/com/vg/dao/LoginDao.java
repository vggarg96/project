package com.vg.dao;

import java.sql.*;

public class LoginDao {
	public static boolean validate(String email, String pass) {
		boolean status = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "goku@94251");

			PreparedStatement ps = con.prepareStatement("select * from user where email_id=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			status = rs.next();
			System.out.println("status is " + status);

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
