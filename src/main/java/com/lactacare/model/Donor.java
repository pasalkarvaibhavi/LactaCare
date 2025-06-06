package com.lactacare.model;

import java.sql.Date;

public class Donor {
	private int id;
    private int userId;
    private String fullName;
    private String contact;
    private Date dob;
    private String address;
    private String lactationStatus;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLactationStatus() {
		return lactationStatus;
	}
	public void setLactationStatus(String lactationStatus) {
		this.lactationStatus = lactationStatus;
	}
    
    
    
}
