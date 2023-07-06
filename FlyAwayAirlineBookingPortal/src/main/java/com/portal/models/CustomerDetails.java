package com.portal.models;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Customer_Details")
public class CustomerDetails {
 @Id @GeneratedValue
	private int c_id;
 private String c_name;
 private String email;
 private String phonenum;
 private String gender;
 private float totalfare;
 
private int numberOfPassenger;
 private int flight_no;
 
 public float getTotalfare() {
	return totalfare;
}

public void setTotalfare(float totalfare) {
	this.totalfare = totalfare;
}

public int getC_id() {
	return c_id;
}

public void setC_id(int c_id) {
	this.c_id = c_id;
}
public String getC_name() {
	return c_name;
}
public void setC_name(String c_name) {
	this.c_name = c_name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhonenum() {
	return phonenum;
}
public void setPhonenum(String phonenum) {
	this.phonenum = phonenum;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public int getNumberOfPassenger() {
	return numberOfPassenger;
}
public void setNumberOfPassenger(int numberOfPassenger) {
	this.numberOfPassenger = numberOfPassenger;
}
public int getFlight_no() {
	return flight_no;
}
public void setFlight_no(int flight_no) {
	this.flight_no = flight_no;
}
 
}
