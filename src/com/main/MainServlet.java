package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orders.OrdersDAO;
import com.util.DBConn;

public class MainServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		Connection conn = DBConn.getConnection();
		OrdersDAO dao = new OrdersDAO(conn);
		
		String sessionUserId = (String) req.getSession().getAttribute("userId");
		String userId = null;

		if (sessionUserId != null) {
			userId = sessionUserId;
		}

		// 메인페이지
		if (uri.indexOf("main.do") != -1) {
		
		req.setAttribute("userId", userId);
		
		url = "/main/main.jsp";
		forward(req, resp, url);
		
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
