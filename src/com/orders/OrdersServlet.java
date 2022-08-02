package com.orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.util.DBConn;
import com.util.MyPage;

public class OrdersServlet extends HttpServlet {

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

		MyPage myPage = new MyPage();

		String sessionUserId = (String) req.getSession().getAttribute("userId");
		String userId = null;

		if (sessionUserId != null) {
			userId = sessionUserId;
		}

		if (userId == null) {
			out.print("<script>");
			out.print("alert('로그인을 해주세요');");
			out.print("locasion:href='" + cp + "/member/login.jsp';");
			out.print("</script>");
			return;
		}

		if (uri.indexOf("cartList.do") != -1) {

		} else if (uri.indexOf("cartList.do") != -1) {

		} else if (uri.indexOf("wishList.do") != -1) {

		} else if (uri.indexOf("orderList.do") != -1) {

		} else if (uri.indexOf("orderPayment.do") != -1) {

		} else if (uri.indexOf("orderComplete.do") != -1) {

		} else if (uri.indexOf("cancel.do") != -1) {

		}

	}

}
