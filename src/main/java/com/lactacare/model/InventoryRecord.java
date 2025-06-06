package com.lactacare.model;

import java.util.Date;

public class InventoryRecord {
    private String userName;
    private Date date;
    private int amountMl;
    private String status;
    private String recordType;

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    
    public int getAmountMl() { return amountMl; }
    public void setAmountMl(int amountMl) { this.amountMl = amountMl; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getRecordType() { return recordType; }
    public void setRecordType(String recordType) { this.recordType = recordType; }
}