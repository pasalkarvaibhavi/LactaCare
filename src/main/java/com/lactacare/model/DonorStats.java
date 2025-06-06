package com.lactacare.model;

public class DonorStats {
    private int totalDonations;
    private int totalVolume;
    private String donorDuration;

    public DonorStats(int totalDonations, int totalVolume, String donorDuration) {
        this.totalDonations = totalDonations;
        this.totalVolume = totalVolume;
        this.donorDuration = donorDuration;
    }

	public int getTotalDonations() {
		return totalDonations;
	}

	public void setTotalDonations(int totalDonations) {
		this.totalDonations = totalDonations;
	}

	public int getTotalVolume() {
		return totalVolume;
	}

	public void setTotalVolume(int totalVolume) {
		this.totalVolume = totalVolume;
	}

	public String getDonorDuration() {
		return donorDuration;
	}

	public void setDonorDuration(String donorDuration) {
		this.donorDuration = donorDuration;
	}
    
}