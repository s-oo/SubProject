package com.boards;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardsDAO {
	
	private Connection conn;
	
	public BoardsDAO(Connection conn) {
		this.conn = conn;
	}
	
	//num의 최대값
	public int getMaxNum() {
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(boardNum),0) from board";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return maxNum;
		
	}
	
	//입력
	public int insertData(BoardsDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into board (boardNum,userId,productNum,subject,content,";
			sql+= " postDate,community,hitCount) ";
			sql+= "values (?,?,?,?,?,sysdate,?,0,)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setInt(3, dto.getProductNum());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getCommunity());
			
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
				
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;		
		
	}
	
	//전체데이터 가져오기
	public List<BoardsDTO> getLists(int start, int end, 
			String searchKey,String searchValue){
		
		List<BoardsDTO> lists = new ArrayList<BoardsDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select * from  (";
			sql+= "select rownum rnum,data.* from (";
			sql+= "select boardNum,userId,subject,hitCount,";
			sql+= "to_char(postDate,'YYYY-MM-DD') postDate ";
			//sql+= "from board order by num desc) data) ";
			sql+= "from board where " + searchKey + " like ? order by boardNum desc) data) ";
			sql+= "where rnum>=? and rnum<=?";			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardsDTO dto = new BoardsDTO();
				
				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
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
	
	//전체데이터의 갯수
	public int getDataCount(String searchKey,String searchValue) {
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select nvl(count(*),0) from board ";
			sql+= "where " + searchKey + " like ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dataCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dataCount;
		
	}
	
	//boardNum으로 한개의 데이터 가져오기
	public BoardsDTO getReadData(int boardNum) {
		
		BoardsDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select boardNum,userId,subject, content,postDate,";
			sql+= "community,hitCount from board where boardNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new BoardsDTO();
				
				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getString("postDat"));
				dto.setCommunity(rs.getString("community"));
				dto.setHitCount(rs.getInt("hitCount"));
				
			}
			
			rs.close();
			pstmt.close();			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;		
		
	}
	
	//조회수 증가
	public int updateHitCount(int boardNum) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update board set hitCount = hitCount + 1 where boardNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,boardNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;		
		
	}
	
	//수정
//	public int updateData(BoardsDTO dto) {
		
//		int result = 0;
//		PreparedStatement pstmt = null;
//		String sql;
//		
//		try {
//			
//			sql = "update board set name=?,pwd=?,email=?,subject=?,";
//			sql+= "content=? where boardNum=?";
//			
//			pstmt = conn.prepareStatement(sql);
//						
//			pstmt.setString(1, dto.getName());
//			pstmt.setString(2, dto.getPwd());
//			pstmt.setString(3, dto.getEmail());
//			pstmt.setString(4, dto.getSubject());
//			pstmt.setString(5, dto.getContent());
//			pstmt.setInt(6, dto.getNum());
//			
//			result = pstmt.executeUpdate();
//			
//			pstmt.close();
//				
//			
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
//		
//		return result;		
//		
//	}
	
	//삭제
	public int deleteData(int boardNum) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete board where boardNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,boardNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	

}


























