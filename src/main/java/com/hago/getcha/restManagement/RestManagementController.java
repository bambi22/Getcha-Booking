package com.hago.getcha.restManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestManagementController {

	@RequestMapping(value="restRegisterProc")
	public String memberNav() {
		return "forward:menuRegister";
	}
	
	
}
