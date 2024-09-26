package com.boards;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.comments.CommentsDAO;
import com.product.ProductDAO;
import com.product.ProductDTO;

public class QnaDAO {

	private Connection conn;

	public QnaDAO(Connection conn) {
		this.conn = conn;
	}

	// num�� �ִ밪
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(boardNum),0) from qna";

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
	public int insertData(QnaDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into qna (boardNum,userId,productNum,subject,content,";
			sql += " postDate,hits) ";
			sql += "values (?,?,?,?,?,sysdate,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setInt(3, dto.getProductNum());
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
	public List<QnaDTO> getLists(int start, int end, String searchKey, String searchValue, String userId) {

		List<QnaDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select * from  (";
			sql += "select rownum rnum,data.* from (";
			sql += "select boardNum,userId,productNum,subject,hits,";
			sql += "to_char(postDate,'YYYY-MM-DD') postDate ";
			// sql+= "from board order by num desc) data) ";
			sql += "from qna where UPPER(" + searchKey + ") like UPPER(?) AND ? IN (USERID, 'KRISTAL') order by boardNum desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setString(2, userId);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				QnaDTO dto = new QnaDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setProductNum(rs.getInt("productNum"));
				dto.setSubject(rs.getString("subject"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));
				
				dto.setProductDTO(new ProductDAO(conn).getReadData(rs.getInt("productNum")));
				
				dto.setCommentsDTO(new CommentsDAO(conn).getReadData(dto.getBoardNum(), "qna"));
				
				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	public List<QnaDTO> getLists(int productNum) {//������(KRISTAL)�� ���

		List<QnaDTO> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "SELECT * FROM (SELECT BOARDNUM, USERID, PRODUCTNUM, SUBJECT, CONTENT, POSTDATE, HITS, ROWNUM RNUM ";
			sql += "FROM QNA WHERE PRODUCTNUM IN (";
			sql += "SELECT PRODUCTNUM FROM PRODUCT WHERE PRODUCTNUM = ?) ORDER BY POSTDATE DESC) ORDER BY RNUM DESC";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				QnaDTO dto = new QnaDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setProductNum(rs.getInt("PRODUCTNUM"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setRnum(rs.getInt("rnum"));

				ProductDTO productDTO = new ProductDAO(conn).getReadData(rs.getInt("productNum"));

				dto.setProductDTO(productDTO);
				dto.setProductName(productDTO.getProductName());
				dto.setProductCategory(productDTO.getProductCategory());
				dto.setSaveFileName(productDTO.getSaveFileName());
				
				dto.setCommentsDTO(new CommentsDAO(conn).getReadData(dto.getBoardNum(), "qna"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	public List<QnaDTO> getLists(int productNum, String userId) {//�Ϲ� ȸ���� ���

		List<QnaDTO> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "SELECT * FROM (SELECT BOARDNUM, USERID, PRODUCTNUM, SUBJECT, CONTENT, POSTDATE, HITS, ROWNUM RNUM ";
			sql += "FROM QNA WHERE PRODUCTNUM IN (";
			sql += "SELECT PRODUCTNUM FROM PRODUCT WHERE PRODUCTNUM = ? AND USERID = ?) ORDER BY BOARDNUM) ORDER BY RNUM DESC";

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				QnaDTO dto = new QnaDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setProductNum(rs.getInt("PRODUCTNUM"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setRnum(rs.getInt("rnum"));

				ProductDTO productDTO = new ProductDAO(conn).getReadData(rs.getInt("productNum"));

				dto.setProductDTO(productDTO);
				dto.setProductName(productDTO.getProductName());
				dto.setProductCategory(productDTO.getProductCategory());
				dto.setSaveFileName(productDTO.getSaveFileName());
				
				dto.setCommentsDTO(new CommentsDAO(conn).getReadData(dto.getBoardNum(), "qna"));

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
	public int getDataCount(String searchKey, String searchValue, String userId) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from qna ";
			sql += "where " + searchKey + " like ?";
			if (!userId.equals("KRISTAL")) {
				sql += " AND USERID = ?";
			}
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			if (!userId.equals("KRISTAL")) {
				pstmt.setString(2, userId);
			}
			
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
	public QnaDTO getReadData(int boardNum) {

		QnaDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select boardNum,userId,productNum,subject,content,postDate,hits ";
			sql += "from qna where boardNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new QnaDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setProductNum(rs.getInt("productNum"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setHits(rs.getInt("hits"));
				
				dto.setProductDTO(new ProductDAO(conn).getReadData(rs.getInt("productNum")));

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

			sql = "update qna set hits = hits + 1 where boardNum=?";

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
	public int updateData(QnaDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;
		
		try {
			
			sql = "UPDATE QNA SET SUBJECT = ?, CONTENT = ? ";
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

			sql = "delete qna where boardNum=?";

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
