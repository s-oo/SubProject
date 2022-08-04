package com.orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.MemberDAO;
import com.member.MemberDTO;
import com.util.DBConn;

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
		
		String sessionUserId = (String) req.getSession().getAttribute("userId");
		String userId = null;

		if (sessionUserId != null) {
			userId = sessionUserId;
		}

//		if (userId == null) {
//			out.print("<script>");
//			out.print("alert('로그인을 해주세요');");
////			out.print("locasion:href='/sub/shop/member/login.do';");
//			out.print("</script>");
//			
//			url = "/sub/shop/member/login.do";
//			resp.sendRedirect(url);
//			
//			return;
//		}
		
		// 추가
		if (uri.indexOf("addList.do") != -1) {

			int orderNum = dao.getMaxNum();
			int productNum = Integer.parseInt(req.getParameter("productNum"));
			String progress = req.getParameter("progress");
			
			String quantity = req.getParameter("productQuantity");
			int productQuantity = 0;
			if (quantity != null) {
				productQuantity = Integer.parseInt(quantity);
			}
			
			OrdersDTO dto = new OrdersDTO();
			
			dto.setOrderNum(orderNum);
			dto.setUserId(userId);
			dto.setProductNum(productNum);
			dto.setProductQuantity(productQuantity);
			dto.setProgress(progress);
			
			int result = dao.insertData(dto);
			
			out.print("<script>");
			if (result == 0) {
				out.print("alert('오류');");
			}
			out.print("history.back()");
			out.print("</script>");
			
		} else if (uri.indexOf("modifyList.do") != -1) {

			int orderNum = Integer.parseInt(req.getParameter("orderNum"));
			String progress = req.getParameter("progress");
			
			String quantity = req.getParameter("productQuantity");
			int productQuantity = 0;
			if (quantity != null && progress.equals("wishList") ) {
				productQuantity = Integer.parseInt(quantity);
			}
			
			OrdersDTO dto = new OrdersDTO();

			dto.setOrderNum(orderNum);
			dto.setProductQuantity(productQuantity);
			dto.setProgress(progress);
			
			int result = dao.updateData(dto);
			
			out.print("<script>");
			if (result == 0) {
				out.print("alert('오류');");
			}
			out.print("history.back()");
			out.print("</script>");
			
		// 장바구니 목록
		} else if (uri.indexOf("cartList.do") != -1) {
			
			userId = "asd";
			String progress = "cartList";
			List<OrdersDTO> list = dao.getList(userId, progress);

			req.setAttribute("list", list);
			
			req.setAttribute("userId", userId);
				
			url = "/orders/cartList.jsp";
			forward(req, resp, url);

		// 찜 목록
		} else if (uri.indexOf("wishList.do") != -1) {

			String progress = "wishList";
			List<OrdersDTO> list = new ArrayList<>();
			
			list = dao.getList(userId, progress);

			req.setAttribute("list", list);
			
			url = "/orders/wishList.jsp";
			forward(req, resp, url);

		// 주문/결제
		} else if (uri.indexOf("orderPayment.do") != -1) {
			
			// 주문상품
			String[] orderNum = (req.getParameterValues("orderNum"));
			List<OrdersDTO> list = new ArrayList<>();
			
			list = dao.getList(orderNum);
			
			// 회원정보
			MemberDTO memberDTO = new MemberDAO(conn).getReadData(userId);
			
			req.setAttribute("list", list);
			req.setAttribute("memberDTO", memberDTO);
			
			url = "/orders/orderPayment.jsp";
			forward(req, resp, url);

		// 결제 처리
		} else if (uri.indexOf("orderPayment_ok.do") != -1) {
			
			
			
		// 주문 완료
		} else if (uri.indexOf("orderComplete.do") != -1) {

			int sum = Integer.parseInt(req.getParameter("sum"));
			
			MemberDTO memberDTO = new MemberDAO(conn).getReadData(userId);
			
			req.setAttribute("sum", sum);
			req.setAttribute("memberDTO", memberDTO);

			url = "/orders/orderComplete.jsp";
			forward(req, resp, url);

		// 주문 목록
		} else if (uri.indexOf("orderList.do") != -1) {

			String progress = "orderList";
			List<OrdersDTO> list = new ArrayList<>();
			
			list = dao.getList(userId, progress);
			
			req.setAttribute("list", list);
			
			url = "/sub/orders/orderList.jsp";
			forward(req, resp, url);
		
		// 결제내역
		} else if (uri.indexOf("cancelList.do") != -1) {
			
			String progress = "cancelList";
			List<OrdersDTO> list = new ArrayList<>();
			
			list = dao.getList(userId, progress);
			
			req.setAttribute("list", list);
			
			url = "/orders/cancelList.jsp";
			forward(req, resp, url);

		}

	}

}
