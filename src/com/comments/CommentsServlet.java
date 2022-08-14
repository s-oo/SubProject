package com.comments;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

public class CommentsServlet extends HttpServlet {

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
		String referer = (String) req.getHeader("REFERER");

		String url;

		Connection conn = DBConn.getConnection();
		CommentsDAO dao = new CommentsDAO(conn);

		String sessionUserId = (String) req.getSession().getAttribute("userId");
		String userId = null;

		if (sessionUserId != null) {
			userId = sessionUserId;
		}

		if (!userId.equals("KRISTAL")) {
			out.print("<script>");
			out.print("alert('권한이 없습니다.');");
			out.print("location.href='" + referer + "';");
			out.print("</script>");
			
			return;
		}

		if (uri.indexOf("write_ok.do") != -1) {

			int boardNum = Integer.parseInt(req.getParameter("boardNum"));
			String community = req.getParameter("community");
			String content = req.getParameter("content");

			CommentsDTO dto = new CommentsDTO();

			dto.setBoardNum(boardNum);
			dto.setCommunity(community);
			dto.setUserId(userId);
			dto.setContent(content);

			int result = dao.insertData(dto);

			if (result == 0) {
				out.print("<script>");
				out.print("alert('오류');");
				out.print("history.back()");
				out.print("</script>");
				
				return;
			}

			resp.sendRedirect(referer);

		} else if (uri.indexOf("update_ok.do") != -1) {

			int boardNum = Integer.parseInt(req.getParameter("boardNum"));
			String community = req.getParameter("community");
			String content = req.getParameter("content");

			CommentsDTO dto = dao.getReadData(boardNum, community);

			dto.setContent(content);

			int result = dao.updateData(dto);

			if (result == 0) {
				out.print("<script>");
				out.print("alert('오류');");
				out.print("history.back()");
				out.print("</script>");
				
				return;
			}

			resp.sendRedirect(referer);

		} else if (uri.indexOf("delete_ok.do") != -1) {

			int boardNum = Integer.parseInt(req.getParameter("boardNum"));
			String community = req.getParameter("community");

			int result = dao.deleteData(boardNum, community);

			if (result == 0) {
				out.print("<script>");
				out.print("alert('오류');");
				out.print("history.back()");
				out.print("</script>");
				
				return;
			}

			resp.sendRedirect(referer);

		}

	}

}
