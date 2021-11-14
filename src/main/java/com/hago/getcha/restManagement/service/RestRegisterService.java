package com.hago.getcha.restManagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hago.getcha.restManagement.dao.IRestManagementDAO;
import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Service
public class RestRegisterService {
	@Autowired IRestManagementDAO rmDao;
	
	public void restRegisterProc(RestaurantDTO restDto, String[] facilities, String[] openHour) {
		String[] addrStr = restDto.getAddress().split(",");
		restDto.setAddress(addrStr[0] + addrStr[1]);
		String[] typeStr = restDto.getType().split(",");
		if(typeStr[0].equals("direct")) 
			restDto.setType(typeStr[1]);
		else
			restDto.setType(typeStr[0]);
		rmDao.restRegister(restDto);
		
		for(String facility : facilities) {
			FacilitiesDTO facilDto = new FacilitiesDTO();
			facilDto.setRestNum(restDto.getRestNum());
			facilDto.setFacility(facility);
			rmDao.addFacilities(facilDto);
		}
		
		for(String openStr : openHour) {
			OpenHourDTO openDto = new OpenHourDTO();
			String[] open = openStr.split(" ");
			openDto.setRestNum(restDto.getRestNum());
			if(open.length == 2) {
				openDto.setWeekSelection(open[0]);
				openDto.setDaySelection("");
				openDto.setHours(open[1]);
			}else {
				openDto.setWeekSelection(open[0]);
				openDto.setDaySelection(open[1]);
				openDto.setHours(open[2]);				
			}
			rmDao.addOpenHour(openDto);
		}
	}
}
