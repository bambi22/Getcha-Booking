package com.hago.getcha.restManagement.dto;

import com.hago.getcha.admin.dto.ManagerDTO;

public class RestaurantDTO extends ManagerDTO{
	private int restNum;
	private String restName;
	private String restIntro;
	private double avgPoint;
	private String zipcode;
	private String address;
	private String dong;
	private String type;
	private int capacity;
	private String promotion;
	private String representImage;
	private String registerDate;
	
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getRestIntro() {
		return restIntro;
	}
	public void setRestIntro(String restIntro) {
		this.restIntro = restIntro;
	}
	public double getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(double avgPoint) {
		this.avgPoint = avgPoint;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getPromotion() {
		return promotion;
	}
	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}
	public String getRepresentImage() {
		return representImage;
	}
	public void setRepresentImage(String representImage) {
		this.representImage = representImage;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	
	
}
