package com.hago.getcha.restManagement.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface IRestRegisterService {
	String FILE_LOCATION_PROMOTION = "C:\\Java_folder\\spring_workspace\\getcha\\src\\main\\webapp\\resources\\img\\promotion";
	String FILE_LOCATION_RESTAURANT = "C:\\Java_folder\\spring_workspace\\getcha\\src\\main\\webapp\\resources\\img\\restaurant";
	
	public void restRegisterProc(String[] facilities, String[] openHour, MultipartHttpServletRequest req);
}
