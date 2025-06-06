package com.lactacare.model;

import java.util.Date;

public class Screening {
    private int id;
    private int donorId;
    private int userId;
    private Date babyDob;
    private String excessMilk;
    private String recentIllness;
    private String medications;
    private String infectiousDiseases;
    private String chronicIllness;
    private String transplant;
    private String smoke;
    private String alcohol;
    private String dietType;
    private String travel;
    private boolean consent1;
    private boolean consent2;
    private boolean consent3;
    private boolean consent4;
    private Date submissionDate;
    private String status;
    private String disqualificationReasons;
    private Date eligibilityExpiry;

    public Screening() {}

    public Screening(int donorId, int userId, Date babyDob, String excessMilk, 
                    String recentIllness, String medications, String infectiousDiseases,
                    String chronicIllness, String transplant, String smoke, 
                    String alcohol, String dietType, String travel, 
                    boolean consent1, boolean consent2, boolean consent3, boolean consent4) {
        this.donorId = donorId;
        this.userId = userId;
        this.babyDob = babyDob;
        this.excessMilk = excessMilk;
        this.recentIllness = recentIllness;
        this.medications = medications;
        this.infectiousDiseases = infectiousDiseases;
        this.chronicIllness = chronicIllness;
        this.transplant = transplant;
        this.smoke = smoke;
        this.alcohol = alcohol;
        this.dietType = dietType;
        this.travel = travel;
        this.consent1 = consent1;
        this.consent2 = consent2;
        this.consent3 = consent3;
        this.consent4 = consent4;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getDonorId() { return donorId; }
    public void setDonorId(int donorId) { this.donorId = donorId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public Date getBabyDob() { return babyDob; }
    public void setBabyDob(Date babyDob) { this.babyDob = babyDob; }
    public String getExcessMilk() { return excessMilk; }
    public void setExcessMilk(String excessMilk) { this.excessMilk = excessMilk; }
    public String getRecentIllness() { return recentIllness; }
    public void setRecentIllness(String recentIllness) { this.recentIllness = recentIllness; }
    public String getMedications() { return medications; }
    public void setMedications(String medications) { this.medications = medications; }
    public String getInfectiousDiseases() { return infectiousDiseases; }
    public void setInfectiousDiseases(String infectiousDiseases) { 
        this.infectiousDiseases = infectiousDiseases; 
    }
    public String getChronicIllness() { return chronicIllness; }
    public void setChronicIllness(String chronicIllness) { 
        this.chronicIllness = chronicIllness; 
    }
    public String getTransplant() { return transplant; }
    public void setTransplant(String transplant) { this.transplant = transplant; }
    public String getSmoke() { return smoke; }
    public void setSmoke(String smoke) { this.smoke = smoke; }
    public String getAlcohol() { return alcohol; }
    public void setAlcohol(String alcohol) { this.alcohol = alcohol; }
    public String getDietType() { return dietType; }
    public void setDietType(String dietType) { this.dietType = dietType; }
    public String getTravel() { return travel; }
    public void setTravel(String travel) { this.travel = travel; }
    public boolean isConsent1() { return consent1; }
    public void setConsent1(boolean consent1) { this.consent1 = consent1; }
    public boolean isConsent2() { return consent2; }
    public void setConsent2(boolean consent2) { this.consent2 = consent2; }
    public boolean isConsent3() { return consent3; }
    public void setConsent3(boolean consent3) { this.consent3 = consent3; }
    public boolean isConsent4() { return consent4; }
    public void setConsent4(boolean consent4) { this.consent4 = consent4; }
    public Date getSubmissionDate() { return submissionDate; }
    public void setSubmissionDate(Date submissionDate) { 
        this.submissionDate = submissionDate; 
    }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getDisqualificationReasons() { return disqualificationReasons; }
    public void setDisqualificationReasons(String disqualificationReasons) { 
        this.disqualificationReasons = disqualificationReasons; 
    }
    public Date getEligibilityExpiry() { return eligibilityExpiry; }
    public void setEligibilityExpiry(Date eligibilityExpiry) { 
        this.eligibilityExpiry = eligibilityExpiry; 
    }
}