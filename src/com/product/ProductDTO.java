package com.product;

public class ProductDTO {
	
	private int productNum;
	private String productName;
	private int productPrice;
	private String productCategory;
	private String[] saveFileName;
	private String[] originalFileName;
	private String[] productSize;
	private String[] productColor;
	private String description;
	
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String[] getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String[] saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String[] getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String[] originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String[] getProductSize() {
		return productSize;
	}
	public void setProductSize(String[] productSize) {
		this.productSize = productSize;
	}
	public String[] getProductColor() {
		return productColor;
	}
	public void setProductColor(String[] productColor) {
		this.productColor = productColor;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
