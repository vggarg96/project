package com.vg.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vg.dao.TrainDao;
import com.vg.model.TrainSearchResultModel;

public class TrainServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("search doget method is called");

		String src = req.getParameter("src");

		String dst = req.getParameter("dst");

		String onDate = req.getParameter("onDate");

		System.out.println("src is " + src + " dst is " + dst + " onDate is " + onDate);

		List<TrainSearchResultModel> searchList = TrainDao.searchTrains(src, dst, onDate);

		req.setAttribute("result", searchList);
		req.setAttribute("src", src);
		req.setAttribute("dest", dst);
		req.setAttribute("date", onDate);

		req.getRequestDispatcher("/searchResult.jsp").forward(req, resp);

	}

}
