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

		if (userId == null) {
			out.print("<script>");
			out.print("alert('로그인을 해주세요');");
//			out.print("locasion:href='/sub/shop/member/login.do';");
			out.print("</script>");
			
			url = "/sub/shop/member/login.do";
			resp.sendRedirect(url);
			
			return;
		}

		// 추가
		if (uri.indexOf("addList_ok.do") != -1) {

			String referer = (String) req.getHeader("REFERER");

			int orderNum = dao.getMaxNum();
			int productNum = Integer.parseInt(req.getParameter("productNum"));
			String orderColor = req.getParameter("orderColor");
			String orderSize = req.getParameter("orderSize");
			String progress = req.getParameter("progress");

			String quantity = req.getParameter("orderQuantity");
			int orderQuantity = 0;
			if (quantity != null) {
				orderQuantity = Integer.parseInt(quantity);
			}

			OrdersDTO dto = new OrdersDTO();

			dto.setOrderNum(orderNum);
			dto.setUserId(userId);
			dto.setProductNum(productNum);
			dto.setOrderQuantity(orderQuantity);
			dto.setOrderColor(orderColor);
			dto.setOrderSize(orderSize);
			dto.setProgress(progress);

			int result = dao.insertData(dto);

			if (result == 0) {
				out.print("<script>");
				out.print("alert('오류');");
				out.print("history.back()");
				out.print("</script>");
			}

			resp.sendRedirect(referer);

			// 수정
		} else if (uri.indexOf("modifyList_ok.do") != -1) {

			String referer = (String) req.getHeader("REFERER");
			int result = 0;

			int orderNum = Integer.parseInt(req.getParameter("orderNum"));
			String orderQuantity = req.getParameter("orderQuantity");
			String orderColor = req.getParameter("orderColor");
			String orderSize = req.getParameter("orderSize");
			String progress = req.getParameter("progress");

			OrdersDTO dto = dao.getReadData(orderNum);
			
			if (orderQuantity != null && !orderQuantity.equals(""))
				dto.setOrderQuantity(Integer.parseInt(orderQuantity));
			if (orderColor != null && !orderColor.equals(""))
				dto.setOrderColor(orderColor);
			if (orderSize != null && !orderSize.equals(""))
				dto.setOrderSize(orderSize);
			if (progress != null && !progress.equals(""))
				dto.setProgress(progress);

			if (dto.getOrderQuantity() == 0) {
				result = dao.deleteData(orderNum);
			} else {
				result = dao.updateData(dto);
			}

			if (result == 0) {
				out.print("<script>");
				out.print("alert('오류');");
				out.print("history.back()");
				out.print("</script>");
				return;
			}

			resp.sendRedirect(referer);

			// 삭제
		} else if (uri.indexOf("delete_ok.do") != -1) {

			String referer = (String) req.getHeader("REFERER");

			int orderNum = Integer.parseInt(req.getParameter("orderNum"));

			int result = dao.deleteData(orderNum);

			if (result == 0) {
				out.print("<script>");
				out.print("alert('오류');");
				out.print("history.back()");
				out.print("</script>");
				return;
			}

			resp.sendRedirect(referer);

			// 장바구니 목록
		} else if (uri.indexOf("cartList.do") != -1) {

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
			String[] orderNum = req.getParameterValues("orderNum");
			
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
			
			String[] orderNum = req.getParameterValues("orderNum");
			OrdersDTO dto = new OrdersDTO();
				
			for (int i = 0; i < orderNum.length; i++) {
				dto = dao.getReadData(Integer.parseInt(orderNum[i]));
				dto.setProgress("orderList");
				dao.updateData(dto);
			}
			
			url = cp + "/shop/orders/orderComplete.do";
			resp.sendRedirect(url);
			
			// 주문 완료
		} else if (uri.indexOf("orderComplete.do") != -1) {

			int tot = Integer.parseInt(req.getParameter("tot"));

			MemberDTO memberDTO = new MemberDAO(conn).getReadData(userId);

			req.setAttribute("tot", tot);
			req.setAttribute("memberDTO", memberDTO);

			url = "/orders/orderComplete.jsp";
			forward(req, resp, url);

			// 주문 목록
		} else if (uri.indexOf("orderList.do") != -1) {

			String progress = "orderList";
			List<OrdersDTO> list = new ArrayList<>();

			list = dao.getList(userId, progress);

			req.setAttribute("list", list);

			url = "/orders/orderList.jsp";
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
