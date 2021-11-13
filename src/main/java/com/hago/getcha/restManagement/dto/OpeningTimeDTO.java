package com.hago.getcha.restManagement.dto;

public class OpeningTimeDTO {
	private String restNum;
	private String weekSelection;
	private String daySelection;
	private String hours;
	
	public String getRestNum() {
		return restNum;
	}
	public void setRestNum(String restNum) {
		this.restNum = restNum;
	}
	public String getWeekSelection() {
		return weekSelection;
	}
	public void setWeekSelection(String weekSelection) {
		this.weekSelection = weekSelection;
	}
	public String getDaySelection() {
		return daySelection;
	}
	public void setDaySelection(String daySelection) {
		this.daySelection = daySelection;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	
	
	
}
