package com.hago.getcha.restManagement.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.restManagement.dto.RestaurantDTO;

public interface IRestManagementService {
	String FILE_LOCATION_RESTAURANT = "C:\\Java_folder\\spring_workspace\\getcha\\src\\main\\webapp\\resources\\img\\restaurant";
	String FILE_LOCATION_PROMOTION = "C:\\Java_folder\\spring_workspace\\getcha\\src\\main\\webapp\\resources\\img\\promotion";
	String FILE_LOCATION_WHOLEMENU = "C:\\Java_folder\\spring_workspace\\getcha\\src\\main\\webapp\\resources\\img\\wholeMenu";
	String FILE_LOCATION_MENU = "C:\\Java_folder\\spring_workspace\\getcha\\src\\main\\webapp\\resources\\img\\menu";
	
	public void restInfo(Model model);
	
	public void modifyBasicInfoProc(MultipartHttpServletRequest req);
	
	public void modifyDetailProc(RestaurantDTO restDto, String[] address, String[] facilities, String[] openHour);
	
	public void modifyPromotionProc(MultipartHttpServletRequest req);
	
	public void deletePromotionProc();
	
	public void menuModifyProc(MultipartHttpServletRequest req);
	
	public void deleteWholeMenuProc();
}
