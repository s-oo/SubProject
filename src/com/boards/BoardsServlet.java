package com.boards;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boards.BoardsDTO;
import com.util.DBConn;
import com.util.MyPage;

public class BoardsServlet extends HttpServlet {

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

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		// uri : 주소가 끝까지 나옴
		String uri = req.getRequestURI();

		Connection conn = DBConn.getConnection();
		BoardsDAO dao = new BoardsDAO(conn);

		MyPage myPage = new MyPage();

		String url;

		String sessionUserId = (String) req.getSession().getAttribute("userId");
		String userId = null;

		if (sessionUserId != null) {
			userId = sessionUserId;
		}

		if (uri.indexOf("write.do") != -1) {

			HttpSession session = req.getSession();

			if (userId == null) {

				url = "/member/login.jsp";
				forward(req, resp, url);
				return;

			}

			url = "/boards/write.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("write_ok.do") != -1) {
			System.out.println("안녕");
			BoardsDTO dto = new BoardsDTO();

			int maxNum = dao.getMaxNum();

			dto.setBoardNum(maxNum + 1);
			dto.setUserId(req.getParameter("userId"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			System.out.println("안녕");
			dao.insertData(dto);

			System.out.println("안녕");

			url = cp + "/shop/boards/list.do";
			resp.sendRedirect(url);

		}

		else if (uri.indexOf("list.do") != -1) {

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue == null) {
				searchKey = "productName";
				searchValue = "";
			} else {
				if (req.getMethod().equalsIgnoreCase("GET")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			}

			int dataCount = dao.getDataCount(searchKey, searchValue);

			int numPerPage = 5;

			int totalPage = myPage.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<BoardsDTO> lists = dao.getLists(start, end, searchKey, searchValue);

			String param = ""; // 검색했던 그 페이지정보로 돌아가준다

			if (searchValue != null && !searchValue.equals("")) {
				param = "searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			} // param: 파라미터 값을 저장하고 있는 저장소
			
			String listUrl = cp + "/shop/boards/list.do";

			if (!param.equals("")) {
				listUrl += "?" + param;
			}

			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);

			String articleUrl = cp + "/shop/article.do?pageNum=" + currentPage;

			if (!param.equals("")) {
				articleUrl += "&" + param;
			}

			// 포워딩할 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("dataCount", dataCount);

			url = "/boards/list.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("article.do") != -1) {

			int boardNum = Integer.parseInt(req.getParameter("boardNum"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null && !searchValue.equals("")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			dao.updateHitCount(boardNum);

			BoardsDTO dto = dao.getReadData(boardNum);

			if (dto == null) {
				url = cp + "/shop/list.do";

				resp.sendRedirect(url);
			}

			int lineSu = dto.getContent().split("\n").length;

			dto.setContent(dto.getContent().replaceAll("\r", "<br/>"));

			String param = "pageNum=" + pageNum;

			if (searchValue != null && !searchValue.equals("")) {

				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			req.setAttribute("dto", dto);
			req.setAttribute("params", param);
			req.setAttribute("lineSu", lineSu);
			req.setAttribute("pageNum", pageNum);

			url = "/boards/article.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("updated.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null && !searchValue.equals("")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			BoardsDTO dto = dao.getReadData(num);

			if (dto == null) {
				url = cp + "/shop/list.do";
				resp.sendRedirect(url);
			}

			String param = "pageNum=" + pageNum;

			if (searchValue != null && !searchValue.equals("")) {

				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", param);
			req.setAttribute("searchKey", searchKey);
			req.setAttribute("searchValue", searchValue);

			url = "/boards/updated.jsp";
			forward(req, resp, url);

		} /*
			 * else if(uri.indexOf("updated_ok.do")!=-1) {
			 * 
			 * 
			 * int num = Integer.parseInt(req.getParameter("num")); String pageNum =
			 * req.getParameter("pageNum");
			 * 
			 * String searchKey = req.getParameter("searchKey"); String searchValue =
			 * req.getParameter("searchValue");
			 * 
			 * if(searchValue!=null&&!searchValue.equals("")) { searchValue =
			 * URLDecoder.decode(searchValue,"UTF-8"); }
			 * 
			 * BoardsDTO dto = new BoardsDTO();
			 * 
			 * dto.setNum(Integer.parseInt(req.getParameter("num")));
			 * dto.setSubject(req.getParameter("subject"));
			 * dto.setName(req.getParameter("name"));
			 * dto.setEmail(req.getParameter("email")); dto.setPwd(req.getParameter("pwd"));
			 * dto.setContent(req.getParameter("content"));
			 * 
			 * //수정된 데이터를 보낸다 dao.updateData(dto);
			 * 
			 * String param = "pageNum=" + pageNum;
			 * 
			 * if(searchValue!=null&&!searchValue.equals("")) {
			 * 
			 * param += "&searchKey=" + searchKey; param += "&searchValue=" +
			 * URLEncoder.encode(searchValue, "UTF-8");
			 * 
			 * }
			 * 
			 * url = cp + "/bbs/list.do?" + param; resp.sendRedirect(url);
			 * 
			 * }
			 */else if (uri.indexOf("deleted_ok") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null && !searchValue.equals("")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}

			dao.deleteData(num);

			String param = "pageNum=" + pageNum;

			if (searchValue != null && !searchValue.equals("")) {

				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			url = cp + "/shop/list.do?" + param;
			resp.sendRedirect(url);

		}

	}

}