package com.lactacare.model;

import java.sql.Date;

public class DonationRecord {
    private Date date;
    private int volume;
    private String type;
    private String  test_result;

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    
    public int getVolume() { return volume; }
    public void setVolume(int volume) { this.volume = volume; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
	public String getTest_result() {
		return test_result;
	}
	public void setTest_result(String test_result) {
		this.test_result = test_result;
	}
    
   }