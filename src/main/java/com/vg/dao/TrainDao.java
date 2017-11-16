package com.vg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.vg.model.TrainSearchResultModel;

public class TrainDao {
	public static List<TrainSearchResultModel> searchTrains(String src, String dst, String onDate) {

		List<TrainSearchResultModel> resultList = new ArrayList();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "goku@94251");

			CallableStatement cStmt = (CallableStatement) con.prepareCall("{call train_avail_procedure(?,?,?)}");

			cStmt.setString(1, src);
			cStmt.setString(2, dst);
			cStmt.setString(3, onDate);

			boolean hadResults = cStmt.execute();

			System.out.println("hadResults is " + hadResults);
			ResultSet rs = cStmt.executeQuery();
			while (hadResults && cStmt.getResultSet().next()) {
				TrainSearchResultModel temp = new TrainSearchResultModel();
				temp.setTrainId(rs.getInt("train_id"));
				temp.setTrainName(rs.getString("train_name"));
				temp.setArrivalTime(rs.getString("dest_arriv_time"));
				temp.setDepartureTime(rs.getString("scr_depart_time"));
				temp.setAvailSeatClass1(rs.getInt("avail_seat_class1"));
				temp.setAvailSeatClass2(rs.getInt("avail_seat_class2"));
				temp.setAvailSeatClas3(rs.getInt("avail_seat_class3"));

				resultList.add(temp);
				System.out.println("train id is " + cStmt.getResultSet().getInt("train_id"));
			}

			System.out.println("list is " + resultList);

		} catch (Exception e) {
			System.out.println(e);
		}

		return resultList;
	}
}
