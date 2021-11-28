package com.hago.getcha;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {
	@Autowired HttpSession session;
	@RequestMapping(value = "/main")
	public String home() {
		return "main";
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
	
	@RequestMapping(value="/restIndex")
	public String restIndex(Model model, @RequestParam String formpath) {
		model.addAttribute("formpath", formpath);
		return "restManagement/restIndex";
	}

	
	@RequestMapping(value="/member")
	public String member() {
		return "member/member";
	}
	
	@RequestMapping(value="/memberView")
	public String memberView() {
		return "member/memberView";
	}
	@RequestMapping(value="/memberModi")
	public String memberModi() {
		return "member/memberModi";
	}
	
	@RequestMapping(value="/deleteForm")
	public String deleteForm() {
		return "member/deleteForm";
	}
	
	@RequestMapping(value="/reservationView")
	public String reservationView() {
		return "reservation/reservationView";
	}
	
	@RequestMapping(value="/calendar")
	public String calendar() {
		return "reservation/calendar";
	}

	@RequestMapping(value = "/deleteReservation")
	public String deleteReservation(int resNum, HttpSession session) {
		return "reservation/deleteReservation";
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
	
	@RequestMapping(value="/restView")
	public String restView() {
		return "restaurant/restView";
	}
	
	@RequestMapping(value = "/myCollection")
	public String myCollection() {
		return "mypage/collectionForm";
	}

}
