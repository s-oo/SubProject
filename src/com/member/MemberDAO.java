package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	private Connection conn;

	public MemberDAO(Connection conn) {
		this.conn=conn;

	}

	public  int insert(MemberDTO dto) {


		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "insert into member values(?,?,?,?,?,?,?,?)";

			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserGender());
			pstmt.setString(5, String.join(",", dto.getUserBirth()));
			pstmt.setString(6, String.join(",", dto.getUserAddr()));			
			pstmt.setString(7, dto.getUserEmail());
			pstmt.setString(8, dto.getUserTel());

			result=pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public  int update(MemberDTO dto) {


		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "update member set userPwd=?, userName=?, userGender=?, userBirth=?, userAddr=?, userEmail=?, userTel=? ";
			sql +="where userId=?";


			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserGender());
			pstmt.setString(4, String.join(",", dto.getUserBirth()));
			pstmt.setString(5, String.join(",", dto.getUserAddr()));			
			pstmt.setString(6, dto.getUserEmail());
			pstmt.setString(7, dto.getUserTel());
			pstmt.setString(8, dto.getUserId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;



	}

	public  int delete(MemberDTO dto) {


		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "delete member where userId=?";


			pstmt=conn.prepareStatement(sql);


			pstmt.setString(1, dto.getUserId());

			result=pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;



	}


	public MemberDTO getReadDataName(String userName) {

		MemberDTO dto = null;

		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {
			sql = "select userId,userPwd,userName,userGender,to_char(userBirth,'YYYY,MM,DD') userBirth,";
			sql+= "userAddr,userEmail,userTel from member where userName=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userName);

			rs=pstmt.executeQuery();

			if(rs.next()) {

				dto = new MemberDTO();

				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserBirth(rs.getString("userBirth").split(","));
				dto.setUserAddr(rs.getString("userAddr").split(","));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserTel(rs.getString("userTel"));				
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;



	}

	public MemberDTO getReadData(String userId) {

		MemberDTO dto = null;

		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {
			sql = "select userId,userPwd,userName,userGender,to_char(userBirth,'YYYY,MM,DD') userBirth,";
			sql+= "userAddr,userEmail,userTel from member where userId=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs=pstmt.executeQuery();

			if(rs.next()) {

				dto = new MemberDTO();
				System.out.println(rs.getString("userBirth"));
				System.out.println("userName");
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserBirth(rs.getString(5).split(","));
				dto.setUserAddr(rs.getString("userAddr").split(","));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserTel(rs.getString("userTel"));				
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;



	}
	
	
}
