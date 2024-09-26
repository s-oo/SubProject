package com.boards;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.comments.CommentsDAO;
import com.orders.OrdersDAO;
import com.orders.OrdersDTO;
import com.product.ProductDAO;
import com.product.ProductDTO;

public class ReviewDAO {

	private Connection conn;

	public ReviewDAO(Connection conn) {
		this.conn = conn;
	}

	// num�� �ִ밪
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(boardNum),0) from review";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	// �Է�
	public int insertData(ReviewDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into review (boardNum,userId,orderNum,subject,content,postDate,hits) ";
			sql += "values (?,?,?,?,?,sysdate,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setInt(3, dto.getOrderNum());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// ��ü������ ��������
	public List<ReviewDTO> getLists(int start, int end, String searchKey, String searchValue) {

		List<ReviewDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select * from  (";
			sql += "select rownum rnum,data.* from (";
			sql += "select boardNum,userId,orderNum,subject,hits,";
			sql += "to_char(postDate,'YYYY-MM-DD') postDate ";
			// sql+= "from board order by num desc) data) ";
			sql += "from review where " + searchKey + " like ? order by boardNum desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewDTO dto = new ReviewDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setSubject(rs.getString("subject"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));

				OrdersDTO ordersDTO = new OrdersDAO(conn).getReadData(rs.getInt("orderNum"));

				dto.setOrdersDTO(ordersDTO);
				dto.setProductName(ordersDTO.getProductName());
				dto.setProductCategory(ordersDTO.getProductCategory());
				dto.setSaveFileName(ordersDTO.getSaveFileName());

				dto.setCommentsDTO(new CommentsDAO(conn).getReadData(dto.getBoardNum(), "reivew"));
				
				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	

	public List<ReviewDTO> getLists(int productNum) {//������(KRISTAL)�� ���

		List<ReviewDTO> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "SELECT * FROM (SELECT BOARDNUM, USERID, ORDERNUM, SUBJECT, CONTENT, POSTDATE, HITS, ROWNUM RNUM ";
			sql+= "FROM REVIEW WHERE ORDERNUM IN (";
			sql+= "SELECT ORDERNUM FROM ORDERS O, PRODUCT P WHERE O.PRODUCTNUM = P.PRODUCTNUM AND O.PRODUCTNUM = ?) ";
			sql+= "ORDER BY BOARDNUM) ORDER BY RNUM DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewDTO dto = new ReviewDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setRnum(rs.getInt("rnum"));

				OrdersDTO ordersDTO = new OrdersDAO(conn).getReadData(rs.getInt("orderNum"));

				dto.setOrdersDTO(ordersDTO);
				dto.setProductName(ordersDTO.getProductName());
				dto.setProductCategory(ordersDTO.getProductCategory());
				dto.setSaveFileName(ordersDTO.getSaveFileName());
				
				dto.setCommentsDTO(new CommentsDAO(conn).getReadData(dto.getBoardNum(), "review"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	public List<ReviewDTO> getLists(int productNum, String userId) {//�Ϲ� ȸ���� ���

		List<ReviewDTO> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "SELECT * FROM (SELECT BOARDNUM, USERID, ORDERNUM, SUBJECT, CONTENT, POSTDATE, HITS, ROWNUM RNUM ";
			sql+= "FROM REVIEW WHERE ORDERNUM IN (";
			sql+= "SELECT ORDERNUM FROM ORDERS O, PRODUCT P WHERE O.PRODUCTNUM = P.PRODUCTNUM AND O.PRODUCTNUM = ? ";
			sql+= "AND USERID = ?) ORDER BY BOARDNUM) ORDER BY RNUM DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setRnum(rs.getInt("rnum"));

				OrdersDTO ordersDTO = new OrdersDAO(conn).getReadData(rs.getInt("orderNum"));

				dto.setOrdersDTO(ordersDTO);
				dto.setProductName(ordersDTO.getProductName());
				dto.setProductCategory(ordersDTO.getProductCategory());
				dto.setSaveFileName(ordersDTO.getSaveFileName());
				
				dto.setCommentsDTO(new CommentsDAO(conn).getReadData(dto.getBoardNum(), "review"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	// ��ü�������� ����
	public int getDataCount(String searchKey, String searchValue) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from review ";
			sql += "where " + searchKey + " like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dataCount = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}

	// boardNum���� �Ѱ��� ������ ��������
	public ReviewDTO getReadData(int boardNum) {

		ReviewDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select boardNum,userId,orderNum,subject, content,postDate,hits ";
			sql += "from review where boardNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ReviewDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setHits(rs.getInt("hits"));

				dto.setOrdersDTO(new OrdersDAO(conn).getReadData(rs.getInt("orderNum")));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	// ��ȸ�� ����
	public int updatehits(int boardNum) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update review set hits = hits + 1 where boardNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// ����
	public int updateData(ReviewDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE REVIEW SET SUBJECT = ?, CONTENT = ? ";
			sql += "WHERE BOARDNUM = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getBoardNum());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// ����
	public int deleteData(int boardNum) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete review where boardNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

}
