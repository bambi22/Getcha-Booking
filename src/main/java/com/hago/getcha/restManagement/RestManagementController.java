package com.hago.getcha.restManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.service.RestRegisterService;

@Controller
public class RestManagementController {
	@Autowired RestRegisterService rrService;
	
	@RequestMapping(value="restRegisterProc")
	public String restRegisterProc(RestaurantDTO restDto, String[] facilities, OpenHourDTO dto, String[] openHour) {
		rrService.restRegisterProc(restDto, facilities, openHour);
		return "forward:menuRegister";
	}
	
	
}
