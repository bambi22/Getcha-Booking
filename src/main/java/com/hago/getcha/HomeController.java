package com.hago.getcha;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main2";

	}
	
	@RequestMapping(value="/member")
	public String member() {
		return "member/member";
	}
	
	@RequestMapping(value="/memberView")
	public String memberView() {
		return "member/memberView";
	}
	
	@RequestMapping(value="/calendar")
	public String calendar() {
		return "member/calendar";
	}
	
	@RequestMapping(value="/memberNav")
	public String memberNav() {
		return "member/memberNav";
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
}
