package edu.jmi.shop.util;

public class DBPage {
   public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurruentPage() {
		return curruentPage;
	}
	public void setCurruentPage(int curruentPage) {
		this.curruentPage = curruentPage;
	}
	public int getEveryCount() {
		return everyCount;
	}
	public void setEveryCount(int everyCount) {
		this.everyCount = everyCount;
	}
   private int recordCount;//总记录数量
   private int pageCount;//页面数量
   private int curruentPage;//当前页面
   private int everyCount=10;//每页记录数量
}
