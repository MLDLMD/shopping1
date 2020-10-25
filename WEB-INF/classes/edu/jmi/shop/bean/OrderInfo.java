package edu.jmi.shop.bean;

import java.sql.Date;

public class OrderInfo {
	
	private String orderNumber;
    private int price;
    private int paymentFlag;
    private int userId;
    private String contactName;
    private String contactMobile;
    private String contactAddress;
    private int status;
    private Date createTime;
    private String message;
    
    
    public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPaymentFlag() {
		return paymentFlag;
	}
	public void setPaymentFlag(int paymentFlag) {
		this.paymentFlag = paymentFlag;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactMobile() {
		return contactMobile;
	}
	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}
	public String getContactAddress() {
		return contactAddress;
	}
	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public OrderInfo() {
		paymentFlag=0;
		status=1;
		contactName="";
		contactMobile="";
		contactAddress="";
		message="";
		   
	}
	
	
}
