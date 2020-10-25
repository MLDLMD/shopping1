package edu.jmi.shop.bean;

import java.sql.Timestamp;

public class VistorLog {
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVistorHost() {
		return vistorHost;
	}

	public void setVistorHost(String vistorHost) {
		this.vistorHost = vistorHost;
	}

	public String getVistorUser() {
		return vistorUser;
	}

	public void setVistorUser(String vistorUser) {
		this.vistorUser = vistorUser;
	}

	public String getVistorURL() {
		return vistorURL;
	}

	public void setVistorURL(String vistorURL) {
		this.vistorURL = vistorURL;
	}

	public String getVistorParam() {
		return vistorParam;
	}

	public void setVistorParam(String vistorParam) {
		this.vistorParam = vistorParam;
	}

	public Timestamp getVistorTime() {
		return vistorTime;
	}

	public void setVistorTime(Timestamp vistorTime) {
		this.vistorTime = vistorTime;
	}

	private int id;
	private String vistorHost;
	private String vistorUser;
	private String vistorURL;
	private String vistorParam;
	private Timestamp vistorTime;

}
