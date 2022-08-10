package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	
	private Connection conn = null;
	
	public ProductDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int getMaxNum() {
		
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(num),0) from product";
			
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

	public int insertData(ProductDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into Product (productNum,productName,productPrice,productCategory,";
			sql+= "saveFileName,originalFileName,productSize,productColor) ";
			sql+= "values (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getProductNum());
			pstmt.setString(2, dto.getProductName());
			pstmt.setInt(3, dto.getProductPrice());
			pstmt.setString(4, dto.getProductCategory());
			pstmt.setString(5, String.join(",", dto.getSaveFileName()));
			pstmt.setString(6, String.join(",", dto.getOriginalFileName()));
			pstmt.setString(7, String.join(",", dto.getProductSize()));
			pstmt.setString(8, String.join(",", dto.getProductColor()));
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;

	}

	public int updateData(ProductDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update product set productNum=?,productName=?,productPrice=?,productCategory=?,";
			sql+= "saveFileName=?,originalFileName=?,productSize=?,productColor=? ";
			sql+= "where productNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getProductNum());
			pstmt.setString(2, dto.getProductName());
			pstmt.setInt(3, dto.getProductPrice());
			pstmt.setString(4, dto.getProductCategory());
			pstmt.setString(5, String.join(",", dto.getSaveFileName()));
			pstmt.setString(6, String.join(",", dto.getOriginalFileName()));
			pstmt.setString(7, String.join(",", dto.getProductSize()));
			pstmt.setString(8, String.join(",", dto.getProductColor()));
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;

	}

	public int deleteData(int productNum) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete product where productNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNum);
			
			result = pstmt.executeUpdate();
			
			pstmt.clearBatch();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;

	}
	
	public List<ProductDTO> getLists(int start,int end,String searchKey,String searchValue) {
		
		List<ProductDTO> lists = new ArrayList<ProductDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select * from (";
			sql+= "select rownum rnum,data.* from(";
			sql+= "select productNum,productName,productPrice,productCategory,";
			sql+= "saveFileName,originalFileName,productSize,productColor ";
			sql+= "from product where " + searchKey;
			sql+= " like ? order by productNum desc) data) ";
			sql+= "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setSaveFileName(rs.getString("saveFileName").split(","));
				dto.setOriginalFileName(rs.getString("originalFileName").split(","));
				dto.setProductSize(rs.getString("productSize").split(","));
				dto.setProductColor(rs.getString("productColor").split(","));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
		
	}

	public List<ProductDTO> getLists(int start,int end,String searchKey,String searchValue, String productCategory) {
		
		List<ProductDTO> lists = new ArrayList<ProductDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			productCategory = "%" + productCategory + "%";
			
			sql = "select * from (";
			sql+= "select rownum rnum,data.* from(";
			sql+= "select productNum,productName,productPrice,productCategory,";
			sql+= "saveFileName,originalFileName,productSize,productColor ";
			sql+= "from product where " + searchKey;
			sql+= " like ? and productCategory like ? order by productNum desc) data) ";
			sql+= "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setString(2, productCategory);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setSaveFileName(rs.getString("saveFileName").split(","));
				dto.setOriginalFileName(rs.getString("originalFileName").split(","));
				dto.setProductSize(rs.getString("productSize").split(","));
				dto.setProductColor(rs.getString("productColor").split(","));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
		
	}
	
	public ProductDTO getReadData(int productNum) {
		
		ProductDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select productNum,productName,productPrice,productCategory,";
			sql+= "saveFileName,originalFileName,productSize,productColor,description ";
			sql+= "from product where productNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ProductDTO();
				
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setSaveFileName(rs.getString("saveFileName").split(","));
				dto.setOriginalFileName(rs.getString("originalFileName").split(","));
				dto.setProductSize(rs.getString("productSize").split(","));
				dto.setProductColor(rs.getString("productColor").split(","));
				dto.setDescription(rs.getString("description"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
		
	}
	


	public int getDataCount(String searchKey,String searchValue,String productCategory) {
		
		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			productCategory = "%" + productCategory + "%";
			
			sql = "select nvl(count(*),0) from product ";
			sql+= "where " + searchKey + " like ? and productCategory like ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			pstmt.setString(2, productCategory);
			
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
	

}
