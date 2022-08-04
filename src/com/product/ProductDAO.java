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
			sql+= "saveFileName1,originalFileName1,categorySize,categoryColor) ";
			sql+= "values (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getProductNum());
			pstmt.setString(2, dto.getProductName());
			pstmt.setInt(3, dto.getProductPrice());
			pstmt.setString(4, dto.getProductCategory());
			pstmt.setString(5, dto.getSaveFileName1());
			pstmt.setString(6, dto.getOriginalFileName1());
			pstmt.setInt(7, dto.getCategorySize());
			pstmt.setString(8, dto.getCategoryColor());
			
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
			sql+= "saveFileName1=?,originalFileName1=?,categorySize=?,categoryColor=? ";
			sql+= "where productNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getProductNum());
			pstmt.setString(2, dto.getProductName());
			pstmt.setInt(3, dto.getProductPrice());
			pstmt.setString(4, dto.getProductCategory());
			pstmt.setString(5, dto.getSaveFileName1());
			pstmt.setString(6, dto.getOriginalFileName1());
			pstmt.setInt(7, dto.getCategorySize());
			pstmt.setString(8, dto.getCategoryColor());
			
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
			sql+= "saveFileName1,originalFileName1 ";
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
				dto.setSaveFileName1(rs.getString("saveFileName1"));
				dto.setOriginalFileName1(rs.getString("originalFileName1"));
				
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
			
			sql = "select p.productNum,productName,productPrice,productCategory,categorySize,categoryColor,";
			sql+= "p.saveFileName1,saveFileName2,saveFileName3,saveFileName4,saveFileName5 ";
			sql+= "from product p, image i ";
			sql+= "where p.productNum = i.productNum and p.productNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ProductDTO();
				
				dto.setProductNum(rs.getInt("productNum"));//select해오는 것들 중 첫번째것을 가져옴
				dto.setProductName(rs.getString("productName"));
				dto.setProductPrice(rs.getInt("productPrice"));
				dto.setProductCategory(rs.getString("productCategory"));
				dto.setCategorySize(rs.getInt("categorySize"));
				dto.setCategoryColor(rs.getString("categoryColor"));
				
				dto.setSaveFileName1(rs.getString("saveFileName1"));
				dto.setSaveFileName2(rs.getString("saveFileName2"));
				dto.setSaveFileName3(rs.getString("saveFileName3"));
				dto.setSaveFileName4(rs.getString("saveFileName4"));
				dto.setSaveFileName5(rs.getString("saveFileName5"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
		
	}

	public int getDataCount(String searchKey,String searchValue) {
		
		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			searchValue = "%" + searchValue + "%";
			
			sql = "select nvl(count(*),0) from product ";
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
	

}
