package com.lactacare.model;

public class ADashboard {
    private int totalDonors;
    private int totalMilk;
    private int totalHospitals;
    private int expiredMilk;

    public int getTotalDonors() { return totalDonors; }
    public void setTotalDonors(int totalDonors) { this.totalDonors = totalDonors; }
    
    public int getTotalMilk() { return totalMilk; }
    public void setTotalMilk(int totalMilk) { this.totalMilk = totalMilk; }
    
    public int getTotalHospitals() { return totalHospitals; }
    public void setTotalHospitals(int totalHospitals) { this.totalHospitals = totalHospitals; }
    
    public int getExpiredMilk() { return expiredMilk; }
    public void setExpiredMilk(int expiredMilk) { this.expiredMilk = expiredMilk; }
	@Override
	public String toString() {
		return "ADashboard [totalDonors=" + totalDonors + ", totalMilk=" + totalMilk + ", totalHospitals="
				+ totalHospitals + ", expiredMilk=" + expiredMilk + "]";
	}
    
    
}