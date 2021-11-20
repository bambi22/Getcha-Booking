package com.hago.getcha;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	@RequestMapping(value="/review")
	public String view() {
		return "review/reviewForm";
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
	Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/update")
	public String update(@RequestParam int reviewNum, @RequestParam String restName,
			@RequestParam String content, @RequestParam String fileNames, Model model) {
		model.addAttribute("reviewNum", reviewNum);
		model.addAttribute("restName", restName);
		model.addAttribute("content", content);
		model.addAttribute("fileNames", fileNames);
		logger.warn("reviewNum: " + reviewNum);
		return "review/updateForm";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

}
