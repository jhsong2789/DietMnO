package com.spring.mno.diet.domain;





public class Diet_info {


private String user;
private String dates;
private String foodtype;
private String foodname;
private String eat;
private String cal;

public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getDates() {
	return dates;
}
public void setDates(String date) {
	this.dates = date.replace("T", "");
	this.dates= this.dates.replace("-", "");
	this.dates= this.dates.replace(":", "");
}
public void Dates(String date) {
	this.dates=date;
}
public String getFoodtype() {
	return foodtype;
}
public void setFoodtype(String foodtype) {
	this.foodtype = foodtype;
}
public String getFoodname() {
	return foodname;
}
public void setFoodname(String foodname) {
	this.foodname = foodname;
}
public String getEat() {
	return eat;
}
public void setEat(String eat) {
	this.eat = eat;
}
public String getCal() {
	return cal;
}
public void setCal(String cal) {
	this.cal = cal;
}

}
