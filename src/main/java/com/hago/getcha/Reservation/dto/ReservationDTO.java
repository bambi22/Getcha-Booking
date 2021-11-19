package com.hago.getcha.Reservation.dto;

public class ReservationDTO {
	private int restNum;
	private String weekselection;
	private String hours;
	private String capacity;
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getWeekselection() {
		return weekselection;
	}
	public void setWeekselection(String weekselection) {
		this.weekselection = weekselection;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
}
