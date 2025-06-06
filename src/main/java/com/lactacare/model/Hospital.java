package com.lactacare.model;

public class Hospital {
    private int id;
    private int userId;
    private String name;
    private String licenseId;
    private String contactPerson;
    private String contactNumber;
    private String address;
    private boolean hasMilkbank;
    
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLicenseId() {
		return licenseId;
	}
	public void setLicenseId(String licenseId) {
		this.licenseId = licenseId;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isHasMilkbank() {
		return hasMilkbank;
	}
	public void setHasMilkbank(boolean hasMilkbank) {
		this.hasMilkbank = hasMilkbank;
	}
    
    
}
