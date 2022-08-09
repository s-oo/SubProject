package com.comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class CommentsDAO {

	private Connection conn = DBConn.getConnection();

	public CommentsDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int insertData(CommentsDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt;
		String sql;
		
		try {
			
			sql = "INSERT INTO COMMENTS(BOARDNUM, COMMUNITY, USERID, POSTDATE, CONTENT) ";
			sql += "VALUES(?, ?, ?, SYSDATE, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getCommunity());
			pstmt.setString(3, dto.getUserId());
			pstmt.setString(4, dto.getContent());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	public int updateData(CommentsDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE COMMENTS SET POSTDATE = SYSDATE, CONTENT = ? WHERE BOARDNUM = ? AND COMMUNITY = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getBoardNum());
			pstmt.setString(3, dto.getCommunity());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int deleteData(int boardNum, String community) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "DELETE COMMENTS WHERE BOARDNUM = ? AND COMMUNITY = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, community);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	public CommentsDTO getReadData(int boardNum, String community) {

		CommentsDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT BOARDNUM, COMMUNITY, USERID, POSTDATE, CONTENT ";
			sql += "FROM COMMENTS ";
			sql += "WHERE BOARDNUM = ? AND COMMUNITY = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, community);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				dto = new CommentsDTO();
				
				dto.setBoardNum(rs.getInt("BOARDNUM"));
				dto.setCommunity(rs.getString("COMMUNITY"));
				dto.setUserId(rs.getString("USERID"));
				dto.setPostDate(rs.getString("POSTDATE"));
				dto.setContent(rs.getString("CONTENT"));
				
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}
	
}
