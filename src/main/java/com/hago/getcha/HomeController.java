package com.hago.getcha;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main2";
	}
	
	@RequestMapping(value="/")
	public String index(Model model) {
		model.addAttribute("formpath", "main2");
		return "member/index";
	}
	@RequestMapping(value="/index")
	public String index(Model model, @RequestParam String formpath) {
		model.addAttribute("formpath", formpath);
		return "member/index";
	}
	
	@RequestMapping(value="/member")
	public String member() {
		return "member/member";
	}
	
	@RequestMapping(value="/memberNav")
	public String memberNav() {
		return "member/memberNav";
	}
	
	@RequestMapping(value="/deleteForm")
	public String memberDelete() {
		return "member/deleteForm";
	}
	
	@RequestMapping(value="/view")
	public String view() {
		return "viewForm";
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
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	
}
