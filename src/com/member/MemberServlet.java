package com.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.util.DBConn;





public class MemberServlet extends HttpServlet {

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

		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);

		String url;
		/*String referer = (String) req.getHeader("REFERER");*/
		String sessionUserId = (String) req.getSession().getAttribute("userId");
		String userId = null;

		if (sessionUserId != null) {
			userId = sessionUserId;
		}



		// �α׾ƿ�����
		if (userId == null) {

			if (uri.indexOf("terms.do") != -1) {

				url = "/member/terms.jsp";
				forward(req, resp, url);





			}// ȸ������ ȭ��
			else if (uri.indexOf("join.do") != -1) {

				MemberDTO dto = new MemberDTO();
				
				dto.setUserId(userId);
				
				
				url = "/member/join.jsp";
				forward(req, resp, url);

				


			}else if (uri.indexOf("join_ok.do") != -1) {

				int result;
				MemberDTO dto = new MemberDTO();
				
				dto.setUserId(req.getParameter("userId"));
				dto.setUserPwd(req.getParameter("userPwd"));
				dto.setUserName(req.getParameter("userName"));
				dto.setUserGender(req.getParameter("userGender"));
				dto.setUserBirth(req.getParameterValues("userBirth"));
				dto.setUserAddr(req.getParameterValues("userAddr"));
				dto.setUserEmail(req.getParameter("userEmail"));
				dto.setUserTel(req.getParameter("userTel"));


				result = dao.insert(dto);

				if (result == 0) {

					out.print("<script>");
					out.print("alert('ȸ�����Խ���');");
					out.print("history.back()");
					out.print("</script>");

				} else {

					url = cp + "/shop/member/join_result.do?userName=" +URLEncoder.encode(dto.getUserName(), "UTF-8");
					resp.sendRedirect(url);

				}


				





				// ȸ������ ���ȭ��
			} else if (uri.indexOf("join_result.do") != -1) {

				String userName = req.getParameter("userName");

				req.setAttribute("userName", userName);
				url = "/member/join_result.jsp";
				forward(req, resp, url);



			}
			
			else if(uri.indexOf("idcheck.do")!=-1) {

				String Id = req.getParameter("userId");

				System.out.println(Id);

				MemberDTO dto = dao.getReadData(Id);

				

				
				if(dto==null)  {

					req.setAttribute("message1", "��밡�� ���̵��Դϴ�.");
					url = "/member/idcheck.jsp";
					forward(req, resp, url);
					return;

				}
				
		
				
				else  {

					req.setAttribute("message2", "�̹� ����� ���̵��Դϴ�.");
					
					
					url = "/member/idcheckfail.jsp";
					forward(req, resp, url);
					return;
				}

				}


			/*else if(uri.indexOf("idcheck.do")!=-1) {

				String Id = req.getParameter("userId");

				//System.out.println(Id);

				boolean result = dao.confirmId(Id);

				if(result == true) {

					req.setAttribute("message", "�̹� ������� ���̵��Դϴ�");
					url = "/member/idcheck.jsp";
					forward(req, resp, url);
					return;
				} 
				else
					req.setAttribute("message", "��밡���� ���̵��Դϴ�");
				url = "/member/idcheck.jsp";
				forward(req, resp, url);
			
				return;
			} */
			
			
		
			
			
			


			else if (uri.indexOf("login.do") != -1) {

				//				String preUrl = req.getHeader("REFERER");
				//				req.getSession().setAttribute("preUrl", preUrl);

				url = "/member/login.jsp";
				forward(req, resp, url);
					
				// �α��� ����
			} else if (uri.indexOf("login_ok.do") != -1) {

				userId = req.getParameter("userId");
				String userPwd = req.getParameter("userPwd");

				MemberDTO dto = dao.getReadData(userId);

				if (dto == null || !dto.getUserPwd().equals(userPwd)) {

					out.print("<script>");
					out.print("alert('�α��ν���');");
					out.print("location.href='cp/shop/member/login.do';");
					out.print("</script>");

					req.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���.");
					req.setAttribute("searchpw", "��й�ȣ ã��");

					url = "/member/login.jsp";
					forward(req, resp, url);
					return;


				} else {

					HttpSession session = req.getSession();

					//					url = (String) session.getAttribute("preUrl");
					//					session.removeAttribute("preUrl");

					session.setAttribute("userId", userId);

					url = cp + "/shop/main/main.do";
					resp.sendRedirect(url);

				}

			}else if(uri.indexOf("findId.do")!=-1) {

				url = "/member/findId.jsp";
				forward(req, resp, url);

			}else if(uri.indexOf("findId_ok.do")!=-1) {
				String userName = req.getParameter("userName");
				String userTel = req.getParameter("userTel");


				MemberDTO dto = dao.getReadDataName(userName);

				if(dto==null||!dto.getUserTel().equals(userTel)) {

					out.print("<script>");
					out.print("alert('�α��ν���');");
					out.print("location.href='cp/shop/member/login.do';");
					out.print("</script>");

					//���̵� Ʋ���ų� �Ǵ� �н����尡 Ʋ����
					req.setAttribute("message", "ȸ�������� �������� �ʽ��ϴ�.");

					url =  "/shop/member/findId.do";
					forward(req, resp, url);
					//���̵� �н����尡 Ʋ���� ��������ʰ� ������	
					return;
				}else {
					req.setAttribute("message", "���̵�� ["+ dto.getUserId() + "] �Դϴ�.");
					req.setAttribute("lego", "�α���");
					url = "/shop/member/findId.do";
					forward(req, resp, url);

				}

				///��й�ȣ ã��
			}else if(uri.indexOf("find.do")!=-1) {
				url =  "/member/find.jsp";
				forward(req, resp, url);

			}else if(uri.indexOf("find_ok.do")!=-1) {
				userId = req.getParameter("userId");
				String userTel = req.getParameter("userTel");


				MemberDTO dto = dao.getReadData(userId);

				if(dto==null||!dto.getUserTel().equals(userTel)) {

					out.print("<script>");
					out.print("alert('�α��ν���');");
					out.print("location.href='cp/shop/member/login.do';");
					out.print("</script>");

					//���̵� Ʋ���ų� �Ǵ� �н����尡 Ʋ����
					req.setAttribute("message", "ȸ�������� �������� �ʽ��ϴ�.");

					url =  "/shop/member/find.do";
					forward(req, resp, url);
					//���̵� �н����尡 Ʋ���� ��������ʰ� ������	
					return;
				}else {
					req.setAttribute("message", "��й�ȣ�� ["+ dto.getUserPwd() + "] �Դϴ�.");
					req.setAttribute("lego", "�α���");
					url = "/shop/member/find.do";
					forward(req, resp, url);
				}

				// ����
			}else {

				out.print("<script>");
				out.print("alert('�߸��� ���� :�α����� ���ּ���');");
				out.print("location.href='" + cp + "/shop/member/login.do';");
				out.print("</script>");

			}
			// �α��� ����
		} else {

			// �α׾ƿ� ����
			if (uri.indexOf("logout_ok.do") != -1) {

				HttpSession session = req.getSession();

				session.removeAttribute("userId");
				session.invalidate();

				url = cp + "/shop/main/main.do";
				resp.sendRedirect(url);


				// ȸ������ ȭ��
			}else if (uri.indexOf("myPage.do") != -1) {

				MemberDTO dto = dao.getReadData(userId);

				req.setAttribute("dto", dto);


				url = "/member/myPage.jsp";
				forward(req, resp, url);

				// ȸ���������� ȭ��
			} else if (uri.indexOf("update.do") != -1) {


				MemberDTO dto = dao.getReadData(userId);

				req.setAttribute("dto", dto);

				url = "/member/update.jsp";
				forward(req, resp, url);

				// ȸ���������� ����
			} else if (uri.indexOf("update_ok.do")!=-1) {


				MemberDTO dto = dao.getReadData(userId);

				dto.setUserId(userId);
				dto.setUserPwd(req.getParameter("userPwd"));
				dto.setUserName(req.getParameter("userName"));
				dto.setUserGender(req.getParameter("userGender"));
				dto.setUserBirth(req.getParameterValues("userBirth"));
				dto.setUserAddr(req.getParameterValues("userAddr"));
				dto.setUserEmail(req.getParameter("userEmail"));
				dto.setUserTel(req.getParameter("userTel"));				

				dao.update(dto);

				url = cp + "/shop/member/myPage.do";
				resp.sendRedirect(url);


			}else if (uri.indexOf("delete.do")!=-1) {

				MemberDTO dto = dao.getReadData(userId);

				req.setAttribute("dto", dto);

				url = "/member/delete.jsp";
				forward(req, resp, url);

			}else if (uri.indexOf("delete_ok.do") != -1) {

				HttpSession session = req.getSession();

				String id = req.getParameter("userId");
				MemberDTO dto = dao.getReadData(id);
				dao.delete(dto);


				session = req.getSession();
				session.removeAttribute("userId");
				session.invalidate();

				url = cp + "/shop/main/main.do";
				resp.sendRedirect(url);

			}else if(uri.indexOf("delete_result.do")!=-1) {

				url = "/member/delete_result.jsp";
				forward(req, resp, url);



			}else {

				out.print("<script>");
				out.print("alert('�߸��� ���� : �̹� �α��� �����Դϴ�.');");
				out.print("history.back()");
				out.print("</script>");

			}

		}

	}

}


