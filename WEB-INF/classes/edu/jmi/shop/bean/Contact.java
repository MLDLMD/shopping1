package edu.jmi.shop.bean;

public class Contact{
	private int id;
	private String name;
	private String mobile;
	private String address;
	private int userid;
	private int contactflag;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getContactflag() {
		return contactflag;
	}
	public void setContactflag(int contactflag) {
		this.contactflag = contactflag;
	}
}
