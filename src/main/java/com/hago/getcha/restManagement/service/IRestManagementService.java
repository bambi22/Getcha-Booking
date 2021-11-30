package com.hago.getcha.restManagement.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.restManagement.dto.RestaurantDTO;

public interface IRestManagementService {
	String FILE_LOCATION_PROMOTION = "/upload/promotion/";
	String FILE_LOCATION_RESTAURANT = "/upload/restaurant/";
	String FILE_LOCATION_MENU = "/upload/menu/";
	String FILE_LOCATION_WHOLEMENU = "/upload/wholeMenu/";
	
	public void restInfo(Model model);
	
	public void modifyBasicInfoProc(MultipartHttpServletRequest req);
	
	public void modifyDetailProc(RestaurantDTO restDto, String[] address, String[] facilities, String[] openHour);
	
	public void modifyPromotionProc(MultipartHttpServletRequest req);
	
	public void deletePromotionProc(MultipartHttpServletRequest req);
	
	public void menuModifyProc(HttpServletRequest req);
	
	public void deleteWholeMenuProc();
}
