package com.hago.getcha.Login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hago.getcha.Member.dto.memberDTO;
import com.hago.getcha.Member.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	//로그인 처리
	@RequestMapping(value="/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute memberDTO member,HttpSession session) {
		
		boolean result = memberService.loginCheck(member, session);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login");
		
		if(result) {
			mav.addObject("msg","성공");
		}else {
			mav.addObject("msg","실패");
		}
		
		return mav;
	}
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		
		return mav;
	}

}
