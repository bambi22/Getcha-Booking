package com.hago.getcha.review.dto;

import com.hago.getcha.restManagement.dto.RestaurantDTO;

public class ReviewCountDTO extends RestaurantDTO {
	private int restNum;
	private int count;
	
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
