package com.orders;

import java.util.List;

import com.product.ProductDTO;

public class DeliveryDTO {

	private int deliveryNum;
	private String userId;
	private String[] orderNum;
	private String deliveryName;
	private String deliveryTel;
	private String[] deliveryAddr;
	private String deliveryEmail;
	private int totalPrice;
	private String deliveryDate;
	private String arriveDate;
	private String progress;

	private List<OrdersDTO> OrderList;

	public int getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String[] getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String[] orderNum) {
		this.orderNum = orderNum;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getDeliveryTel() {
		return deliveryTel;
	}

	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}

	public String[] getDeliveryAddr() {
		return deliveryAddr;
	}

	public void setDeliveryAddr(String[] deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}

	public String getDeliveryEmail() {
		return deliveryEmail;
	}

	public void setDeliveryEmail(String deliveryEmail) {
		this.deliveryEmail = deliveryEmail;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getArriveDate() {
		return arriveDate;
	}

	public void setArriveDate(String arriveDate) {
		this.arriveDate = arriveDate;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public List<OrdersDTO> getOrderList() {
		return OrderList;
	}

	public void setOrderList(List<OrdersDTO> orderList) {
		OrderList = orderList;
	}

}
