package com.hago.getcha.restManagement.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface IRestRegisterService {
	String FILE_LOCATION_PROMOTION = "C:\\Java_folder\\spring_workspace\\getcha_images\\promotion";
	String FILE_LOCATION_RESTAURANT = "C:\\Java_folder\\spring_workspace\\getcha_images\\restaurant";
	String FILE_LOCATION_MENU = "C:\\Java_folder\\spring_workspace\\getcha_images\\menu";
	String FILE_LOCATION_WHOLEMENU = "C:\\Java_folder\\spring_workspace\\getcha_images\\wholeMenu";
	
	public void restRegisterProc(String[] facilities, String[] openHour, MultipartHttpServletRequest req);
	public void menuRegisterProc(MultipartHttpServletRequest req);
}
