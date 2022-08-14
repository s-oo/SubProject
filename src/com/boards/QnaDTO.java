package com.boards;

import com.comments.CommentsDTO;
import com.product.ProductDTO;

public class QnaDTO {

	private int boardNum;
	private String userId;
	private int productNum;
	private String subject;
	private String content;
	private String postDate;
	private int hits;

	private ProductDTO productDTO;
	private String productName;
	private String productCategory;
	private String[] saveFileName;
	private CommentsDTO commentsDTO;
	private int rnum;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	public CommentsDTO getCommentsDTO() {
		return commentsDTO;
	}
	public void setCommentsDTO(CommentsDTO commentsDTO) {
		this.commentsDTO = commentsDTO;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

}
