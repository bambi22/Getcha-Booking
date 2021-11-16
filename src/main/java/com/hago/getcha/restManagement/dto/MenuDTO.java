package com.hago.getcha.restManagement.dto;

public class MenuDTO {
	private int restNum;
	private String category;
	private String menuName;
	private String menuDescript;
	private int unitPrice;
	private String menuImage;
	
	
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public String getMenuDescript() {
		return menuDescript;
	}
	public void setMenuDescript(String menuDescript) {
		this.menuDescript = menuDescript;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	
	
}
