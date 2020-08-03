package com.spring.mno.user.domain;

public class Dates {
	private String user;
	private String date1;
	private String date2;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getDate1() {
		return Integer.parseInt(date1.replace("-", ""));
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public int getDate2() {
		return Integer.parseInt(date2.replace("-", ""));
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}
}
