package com.boards;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {

	private Connection conn;

	public NoticeDAO(Connection conn) {
		this.conn = conn;
	}

	// num�� �ִ밪
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(boardNum),0) from Notice";

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
	public int insertData(NoticeDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into Notice (boardNum,userId,subject,content,postDate,hits) ";
			sql += "values (?,?,?,?,sysdate,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// ��ü������ ��������
	public List<NoticeDTO> getLists(int start, int end, String searchKey, String searchValue) {

		List<NoticeDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select * from  (";
			sql += "select rownum rnum,data.* from (";
			sql += "select boardNum,userId,subject,hits,";
			sql += "to_char(postDate,'YYYY-MM-DD') postDate ";
			// sql+= "from board order by num desc) data) ";
			sql += "from Notice where " + searchKey + " like ? order by boardNum desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				NoticeDTO dto = new NoticeDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setSubject(rs.getString("subject"));
				dto.setHits(rs.getInt("hits"));
				dto.setPostDate(rs.getString("postDate"));

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

			sql = "select nvl(count(*),0) from Notice ";
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
	public NoticeDTO getReadData(int boardNum) {

		NoticeDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select boardNum,userId,subject, content,postDate,hits ";
			sql += "from Notice where boardNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new NoticeDTO();

				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getString("postDate"));
				dto.setHits(rs.getInt("hits"));

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

			sql = "update Notice set hits = hits + 1 where boardNum=?";

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
	public int updateData(NoticeDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;
		
		try {
			
			sql = "UPDATE NOTICE SET SUBJECT = ?, CONTENT = ? ";
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

			sql = "delete Notice where boardNum=?";

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
