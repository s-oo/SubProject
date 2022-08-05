package com.delivery;

public class DeliveryDTO {

	private int deliveryNum;
	private String[] orderNum;
	private String deliveryName;
	private String deliveryTel;
	private String deliveryEmail;
	private int totalPrice;
	private String progress;

	public int getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
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

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

}
