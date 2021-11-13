package com.hago.getcha.restManagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hago.getcha.restManagement.dao.IRestManagementDAO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Service
public class RestRegisterService {
	@Autowired IRestManagementDAO rmDao;
	
	public void restRegisterProc(RestaurantDTO restDto) {
		String[] addrStr = restDto.getAddress().split(",");
		restDto.setAddress(addrStr[0] + addrStr[1]);
		String[] typeStr = restDto.getType().split(",");
		if(typeStr[0].equals("direct")) 
			restDto.setType(typeStr[1]);
		else
			restDto.setType(typeStr[0]);
		rmDao.restRegister(restDto);
	}
}
