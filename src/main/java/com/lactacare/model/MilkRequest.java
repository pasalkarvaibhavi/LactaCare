package com.lactacare.model;

import java.sql.Date;
import java.sql.Timestamp;

public class MilkRequest {
    private int id;
    private int hospitalId;
    private int userId;
    private String hospitalName;
    private String babyName;
    private String babyGender;
    private Date babyDob;
    private double babyWeight;
    private String birthCondition;
    private String healthNotes;
    private String doctorName;
    private String milkType;
    private int quantity;
    private String urgencyLevel;
    private String requestReason;
    private String prescriptionPath;
    private Timestamp requestDate;
    private String status;
	public int getId() {
		return id;
	}
	
	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getBabyName() {
		return babyName;
	}
	public void setBabyName(String babyName) {
		this.babyName = babyName;
	}
	public String getBabyGender() {
		return babyGender;
	}
	public void setBabyGender(String babyGender) {
		this.babyGender = babyGender;
	}
	public Date getBabyDob() {
		return babyDob;
	}
	public void setBabyDob(Date babyDob) {
		this.babyDob = babyDob;
	}
	public double getBabyWeight() {
		return babyWeight;
	}
	public void setBabyWeight(double babyWeight) {
		this.babyWeight = babyWeight;
	}
	public String getBirthCondition() {
		return birthCondition;
	}
	public void setBirthCondition(String birthCondition) {
		this.birthCondition = birthCondition;
	}
	public String getHealthNotes() {
		return healthNotes;
	}
	public void setHealthNotes(String healthNotes) {
		this.healthNotes = healthNotes;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getMilkType() {
		return milkType;
	}
	public void setMilkType(String milkType) {
		this.milkType = milkType;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUrgencyLevel() {
		return urgencyLevel;
	}
	public void setUrgencyLevel(String urgencyLevel) {
		this.urgencyLevel = urgencyLevel;
	}
	public String getRequestReason() {
		return requestReason;
	}
	public void setRequestReason(String requestReason) {
		this.requestReason = requestReason;
	}
	public String getPrescriptionPath() {
		return prescriptionPath;
	}
	public void setPrescriptionPath(String prescriptionPath) {
		this.prescriptionPath = prescriptionPath;
	}
	public Timestamp getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Timestamp requestDate) {
		this.requestDate = requestDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    
    
    
}