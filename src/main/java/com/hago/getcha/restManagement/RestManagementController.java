package com.hago.getcha.restManagement;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.service.RestManagementService;
import com.hago.getcha.restManagement.service.RestRegisterService;

@Controller
public class RestManagementController {
	@Autowired RestRegisterService rrService;
	@Autowired RestManagementService rmService;
	
	
	@RequestMapping(value="restMainProc")
	public String restMainProc(Model model) {
		int result = rrService.restMainProc(model);
		if(result == 1) {
			return "forward:restIndex?formpath=restMain";
		}else {
			return "forward:restRegister";			
		}
	}

	@RequestMapping(value="restRegisterProc")
	public String restRegisterProc(MultipartHttpServletRequest req, String[] facilities, String[] openHour) {
		rrService.restRegisterProc(facilities, openHour, req);
		return "forward:menuRegister";
	}
	
	@RequestMapping(value="menuRegisterProc")
	public String menuRegisterProc(MultipartHttpServletRequest req) {
		rrService.menuRegisterProc(req);
		return "forward:restMainProc";
	}
	
	@RequestMapping(value="restInfoProc")
	public String restInfoProc(Model model) {
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}

	@RequestMapping(value="modifyBasicInfoProc")
	public String modifyBasicInfoProc(Model model, MultipartHttpServletRequest req) {
		rmService.modifyBasicInfoProc(req);
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}

	@RequestMapping(value="modifyDetailProc")
	public String modifyDetailProc(Model model, RestaurantDTO restDto, String[] address, String[] facilities, String[] openHour) {
		rmService.modifyDetailProc(restDto, address, facilities, openHour);
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}
	
	@RequestMapping(value="modifyPromotionProc")
	public String modifyPromotionProc(Model model, MultipartHttpServletRequest req) {
		rmService.modifyPromotionProc(req);
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}
	
	@RequestMapping(value="deletePromotionProc")
	public String deletePromotionProc(Model model, HttpServletRequest req) {
		rmService.deletePromotionProc(req);
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}
	
	@RequestMapping(value="menuModifyProc")
	public String menuModifyProc(Model model, MultipartHttpServletRequest req) {
		rmService.menuModifyProc(req);
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}
	
	@RequestMapping(value="deleteWholeMenuProc")
	public String deleteWholeMenuProc(Model model) {
		rmService.deleteWholeMenuProc();
		rmService.restInfo(model);
		return "forward:restIndex?formpath=restInfo";
	}


	

	
}
