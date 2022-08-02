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
			pstmt.setString(5, dto.getUserBirth());
			pstmt.setString(6, dto.getUserAddress());
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

			sql = "update member set userPwd=?, userName=?, userGender=?, userBirth=?, userAddress=?, userEmail=?, userTel=?";
			sql +="where userId=?";


			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserGender());
			pstmt.setString(4, dto.getUserBirth());
			pstmt.setString(5, dto.getUserAddress());
			pstmt.setString(6, dto.getUserEmail());
			pstmt.setString(7, dto.getUserTel());
			pstmt.setString(8, dto.getUserId());

			result=pstmt.executeUpdate();

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


	public MemberDTO getReadData(String userId) {

		MemberDTO dto = null;

		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {
			sql = "select * from member where userid=?";

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs=pstmt.executeQuery();

			if(rs.next()) {

				dto = new MemberDTO();

				dto.setUserId(rs.getString(1));
				dto.setUserPwd(rs.getString(2));
				dto.setUserName(rs.getString(3));
				dto.setUserGender(rs.getString(4));
				dto.setUserBirth(rs.getString(5));
				dto.setUserAddress(rs.getString(6));
				dto.setUserEmail(rs.getString(7));
				dto.setUserTel(rs.getString(8));				
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;



	}

}
