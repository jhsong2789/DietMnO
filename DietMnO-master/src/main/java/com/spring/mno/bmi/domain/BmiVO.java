package com.spring.mno.bmi.domain;

public class BmiVO {
	private String userid;
	private int weight;
	private int height;
	private String bmi_date;
	private String bmi;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getBmi_date() {
		return bmi_date;
	}

	public void setBmi_date(String bmi_date) {
		this.bmi_date = bmi_date;
	}

	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}

}
