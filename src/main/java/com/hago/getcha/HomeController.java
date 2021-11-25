package com.hago.getcha;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {

	@RequestMapping(value = "/main")
	public String home() {
		return "main";
	}
	
	@RequestMapping(value="/restView")
	public String restView() {
		return "restView";
	}
	
	@RequestMapping(value="/")
	public String index(Model model) {
		model.addAttribute("formpath", "main");
		return "common/index";
	}
	
	@RequestMapping(value="/index")
	public String index(Model model, @RequestParam String formpath) {
		model.addAttribute("formpath", formpath);
		return "common/index";
	}
	
	@RequestMapping(value="/admin")
	public String admin(Model model, @RequestParam String formpath) {
		model.addAttribute("formpath", formpath);
		return "admin/admin";
	}
	
	@RequestMapping(value="/member")
	public String member() {
		return "member/member";
	}
	
	@RequestMapping(value="/deleteForm")
	public String memberDelete() {
		return "member/deleteForm";
	}
	@RequestMapping(value = "/modifyCheck")
	public String modifyCheck() {
		return "member/modifyCheckForm";
	}
	
	@RequestMapping(value="restMain")
	public String restMain() {
		return "restManagement/restMain";
	}
	
	@RequestMapping(value="restRegister")
	public String restRegister() {
		return "restManagement/restRegisterForm";
	}
	
	@RequestMapping(value="menuRegister")
	public String menuRegister() {
		return "restManagement/menuRegisterForm";
	}
	@RequestMapping(value="restInfo")
	public String restInfo() {
		return "restManagement/restInfo";
	}
	
	@RequestMapping(value="/write")
	public String write() {
		return "review/writeForm";
	}
	
	@RequestMapping(value="/review")
	public String review() {
		return "review/reviewForm";
	}
	
	@RequestMapping("/update")
	public String update() {
		return "review/updateForm";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "admin/adminLoginForm";
	}

	@RequestMapping("/managerList")
	public String managerList() {
		return "admin/managerList";
	}
	
	@RequestMapping("/managerRegister")
	public String managerRegister() {
		return "admin/managerRegisterForm";
	}
	
	@RequestMapping("/bookingManagement")
	public String bookingManagement() {
		return "restManagement/bookingManagement";
	}
	
	@RequestMapping("/guideBookList")
	public String guideBookList() {
		return "admin/guideBookList";
	}
	
	@RequestMapping("/restList")
	public String restList() {
		return "restaurant/restList";
	}
	
	@RequestMapping(value = "/myCollection")
	public String myCollection() {
		return "mypage/collectionForm";
	}

}
