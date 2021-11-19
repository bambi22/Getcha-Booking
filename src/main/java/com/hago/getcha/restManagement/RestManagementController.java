package com.hago.getcha.restManagement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.restManagement.service.RestManagementService;
import com.hago.getcha.restManagement.service.RestRegisterService;

@Controller
public class RestManagementController {
	@Autowired RestRegisterService rrService;
	@Autowired RestManagementService rmService;
	
	
	@RequestMapping(value="restRegisterProc")
	public String restRegisterProc(MultipartHttpServletRequest req, String[] facilities, String[] openHour) {
		rrService.restRegisterProc(facilities, openHour, req);
		return "forward:menuRegister";
	}
	
	@RequestMapping(value="menuRegisterProc")
	public String menuRegisterProc(MultipartHttpServletRequest req) {
		rrService.menuRegisterProc(req);
		return "forward:restInfo";
	}
	
	@RequestMapping(value="restInfoProc")
	public String restInfoProc(Model model) {
		rmService.restInfo(model);
		return "forward:restInfo";
	}
	


	
}
