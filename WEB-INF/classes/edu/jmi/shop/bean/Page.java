package edu.jmi.shop.bean;

public class Page {
	private String order_num;
	private String payment_flag;
	private String status;
	private String low;
	private String high;
	private String start;
	private String end;
	private String user_id;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getPayment_flag() {
		return payment_flag;
	}
	public void setPayment_flag(String payment_flag) {
		this.payment_flag = payment_flag;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getHigh() {
		return high;
	}
	public int getPage_num() {
		return page_num;
	}
	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	private int page_num;
	private int pageCount;
	private int pageNow;
	private int pageBefore;
	private int pageNext;
	private int first;
	private int last;
	
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageBefore() {
		return pageBefore;
	}
	public void setPageBefore(int pageBefore) {
		this.pageBefore = pageBefore;
	}
	public int getPageNext() {
		return pageNext;
	}
	public void setPageNext(int pageNext) {
		this.pageNext = pageNext;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
}
