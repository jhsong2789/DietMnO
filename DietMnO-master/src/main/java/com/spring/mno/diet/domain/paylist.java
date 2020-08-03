package com.spring.mno.diet.domain;

public class paylist {
	private String paylist_memberid; 
	private String paylist_orderlist;
	private String paylist_date;
	private int paylist_price;
	public int getPaylist_price() {
		return paylist_price;
	}
	public void setPaylist_price(int paylist_price) {
		this.paylist_price = paylist_price;
	}
	public String getPaylist_memberid() {
		return paylist_memberid;
	}
	public void setPaylist_memberid(String paylist_memberid) {
		this.paylist_memberid = paylist_memberid;
	}
	public String getPaylist_orderlist() {
		return paylist_orderlist;
	}
	public void setPaylist_orderlist(String paylist_orderlist) {
		this.paylist_orderlist = paylist_orderlist;
	}
	public String getPaylist_date() {
		return paylist_date;
	}
	public void setPaylist_date(String paylist_date) {
		this.paylist_date = paylist_date;
	}
	
}
