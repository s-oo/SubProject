package com.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class OrdersDAO {

	private Connection conn = DBConn.getConnection();

	public OrdersDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxnum() {

		int result = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT NVL(MAX(ORDERNUM), 0) FROM ORDERS";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int insetData(OrdersDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "INSERT INTO ORDERS(ORDERNUM, USERID, PRODUCTNUM, PRODUCTQUANTITY, PROGRESS) ";
			sql += "VALUES(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrderNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setInt(3, dto.getProductNum());
			pstmt.setInt(4, dto.getProductQuantity());
			pstmt.setString(5, dto.getProgress());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int updateData(OrdersDTO dto) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "UPDATE ORDERS SET USERID = ?, PRODUCTNUM = ?, PRODUCTQUANTITY = ?, PROGRESS = ?)";
			sql += "WHERE ORDERNUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setInt(2, dto.getProductNum());
			pstmt.setInt(3, dto.getProductQuantity());
			pstmt.setString(4, dto.getProgress());
			pstmt.setInt(5, dto.getOrderNum());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int deleteData(int orderNum) {

		int result = 0;
		PreparedStatement pstmt;
		String sql;

		try {

			sql = "DELETE ORDERS WHERE ORDERNUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public OrdersDTO getList(int orderNum) {

		OrdersDTO dto = null;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT ORDERNUM, USERID, PRODUCTNUM, PRODUCTQUANTITY, PROGRESS ";
			sql += "FROM ORDERS WHERE ORDERNUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new OrdersDTO();
				dto.setOrderNum(rs.getInt("ORDERNUM"));
				dto.setUserId(rs.getString("USERID"));
				dto.setProductNum(rs.getInt("PRODUCTNUM"));
				dto.setProductQuantity(rs.getInt("PRODUCTQUANTITY"));
				dto.setProgress(rs.getString("PROGRESS"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

}
