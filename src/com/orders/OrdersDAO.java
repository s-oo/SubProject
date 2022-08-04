package com.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class OrdersDAO {

	private Connection conn = DBConn.getConnection();

	public OrdersDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

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

	public int insertData(OrdersDTO dto) {

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

			sql = "UPDATE ORDERS SET PRODUCTQUANTITY = ?, PROGRESS = ?)";
			sql += "WHERE ORDERNUM = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProductQuantity());
			pstmt.setString(2, dto.getProgress());
			pstmt.setInt(3, dto.getOrderNum());

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

	public List<OrdersDTO> getList(String userId, String progress) {

		List<OrdersDTO> list = new ArrayList<>();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			sql = "SELECT ORDERNUM, USERID, P.PRODUCTNUM, PRODUCTQUANTITY, PROGRESS, PRODUCTNAME, PRODUCTPRICE, SAVEFILENAME ";
			sql += "FROM ORDERS O, PRODUCT P ";
			sql += "WHERE O.PRODUCTNUM = P.PRODUCTNUM AND USERID = ? AND PROGRESS = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, progress);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				OrdersDTO dto = new OrdersDTO();
				dto.setOrderNum(rs.getInt("ORDERNUM"));
				dto.setUserId(rs.getString("USERID"));
				dto.setProductNum(rs.getInt("PRODUCTNUM"));
				dto.setProductQuantity(rs.getInt("PRODUCTQUANTITY"));
				dto.setProgress(rs.getString("PROGRESS"));

				dto.setProductName(rs.getString("PRODUCTNAME"));
				dto.setProductPrice(rs.getInt("PRODUCTPRICE"));
				dto.setSaveFileName(rs.getString("SAVEFILENAME"));

				list.add(dto);
				
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;

	}
	
	public List<OrdersDTO> getList(String[] orderNum) {

		List<OrdersDTO> list = new ArrayList<>();
		PreparedStatement pstmt;
		ResultSet rs;
		String sql;

		try {

			int n = orderNum.length;
			String str = "";
			
			for (int i = 0; i < n; i ++) {
				if (i != 0)
					str = ", ";
				str += orderNum[i];
			}
			
			sql = "SELECT O.*, PRODUCTNAME, PRODUCTPRICE, SAVEFILENAME ";
			sql += "FROM ORDERS O, PRODUCT P ";
			sql += "WHERE O.PRODUCTNUM = P.PRODUCTNUM AND ORDERNUM IN (?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				OrdersDTO dto = new OrdersDTO();
				dto.setOrderNum(rs.getInt("ORDERNUM"));
				dto.setUserId(rs.getString("USERID"));
				dto.setProductNum(rs.getInt("PRODUCTNUM"));
				dto.setProductQuantity(rs.getInt("PRODUCTQUANTITY"));
				dto.setProgress(rs.getString("PROGRESS"));
				
				dto.setProductName(rs.getString("PRODUCTNAME"));
				dto.setProductPrice(rs.getInt("PRODUCTPRICE"));
				dto.setSaveFileName(rs.getString("SAVEFILENAME"));

				list.add(dto);
				
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;

	}

}
