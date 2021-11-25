package com.hago.getcha.admin.dto;

import com.hago.getcha.restManagement.dto.RestaurantDTO;

public class AdditionDTO extends RestaurantDTO{
	private int restNum;
	private String magazine;
	private String guideBook;
	
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	
	public String getMagazine() {
		return magazine;
	}
	public void setMagazine(String magazine) {
		this.magazine = magazine;
	}
	public String getGuideBook() {
		return guideBook;
	}
	public void setGuideBook(String guideBook) {
		this.guideBook = guideBook;
	}
	
	
}
