package com.lactacare.model;

import java.time.LocalDate;

public class Appointment {
    private int id;
    private int userId;
    private int donorId;
    private String type;
    private LocalDate date;
    private String timeSlot;
    private String notes;
    private String status;
    private Integer milkAmount;  
    private String testResult;   
    private String donorName;    
    
    
   
    public Appointment() {}
    
    public Appointment(int userId, int donorId, String type, LocalDate date, 
                       String timeSlot, String notes, String status) {
        this.userId = userId;
        this.donorId = donorId;
        this.type = type;
        this.date = date;
        this.timeSlot = timeSlot;
        this.notes = notes;
        this.status = status;
        this.milkAmount=milkAmount;
        this.testResult=testResult;
        this.donorName=donorName;
        
    }
    
    
    public Integer getMilkAmount() {
		return milkAmount;
	}

	public void setMilkAmount(Integer milkAmount) {
		this.milkAmount = milkAmount;
	}

	public String getTestResult() {
		return testResult;
	}

	public void setTestResult(String testResult) {
		this.testResult = testResult;
	}

	public String getDonorName() {
		return donorName;
	}

	public void setDonorName(String donorName) {
		this.donorName = donorName;
	}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getDonorId() { return donorId; }
    public void setDonorId(int donorId) { this.donorId = donorId; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }
    
    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }
    
    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}