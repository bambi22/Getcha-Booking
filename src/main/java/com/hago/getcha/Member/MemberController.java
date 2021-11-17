package com.hago.getcha.Member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hago.getcha.Member.dto.memberDTO;
import com.hago.getcha.Member.service.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService service;
	
	@RequestMapping(value = "CheckEmail", produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String>CheckEmail(@RequestBody Map<String, String> map){
		String email = (String)map.get("email");
		String result = service.CheckEmail(email);
		map.put("msg", result);
		return map;
	}
	@RequestMapping(value = "memberProc")
	public String memberProc(memberDTO member, Model model) {
		String msg = service.memberProc(member);
		model.addAttribute("msg", msg);
		return "forward:/index?formpath=member";
	}
	@RequestMapping(value = "memberViewProc")
	public String memberViewProc(String email, Model model, HttpSession session) {
		String sessionEmail = (String)session.getAttribute("email");
		if(email==""||email==null||sessionEmail==""||sessionEmail==null) {
			return "forward:";
		}
		if(sessionEmail.equals(email)) {
			model.addAttribute("memberView", service.memberViewProc(email));
			return "forward:index?formpath=memberView";
		}
		return "forward:";
	}
	@RequestMapping(value = "memberModiProc")
	public String memberModiProc(memberDTO member, HttpSession session, Model model) {
		member.setEmail((String)session.getAttribute("email"));
		int result = service.memberModiProc(member);
		if(result == 0) {
			model.addAttribute("msg", "필수 정보입니다.");
			return "member/memberModi";
		}else if(result == 1) {
			session.invalidate();
			model.addAttribute("msg", "수정되었습니다.");
			return "member/index";
		}else {
			model.addAttribute("msg", "수정실패.");
			return "member/memberModi";
		}
	}
}
