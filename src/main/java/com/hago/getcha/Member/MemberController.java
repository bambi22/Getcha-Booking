package com.hago.getcha.Member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hago.getcha.Member.dto.MemberDTO;
import com.hago.getcha.Member.service.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService service;
	@Autowired HttpSession session;
	
	@RequestMapping(value = "CheckEmail", produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String>CheckEmail(@RequestBody Map<String, String> map){
		String email = (String)map.get("email");
		String result = service.CheckEmail(email);
		map.put("msg", result);
		return map;
	}
	@RequestMapping(value = "memberProc")
	public String memberProc(MemberDTO member, Model model) {
		String msg = service.memberProc(member);
		model.addAttribute("msg", msg);
		return "forward:/index?formpath=member";
	}
	@RequestMapping(value = "/memberView")
	public String memberViewProc(String email, Model model) {
		email = "test@test.com";
		session.setAttribute("email", email);
		String sessionEmail = (String)session.getAttribute("email");
		if(email==""||email==null||sessionEmail==""||sessionEmail==null) {
			return "forward:index?formpath=member";
		}
		if(sessionEmail.equals(email)) {
			model.addAttribute("memberView", service.memberViewProc(email));
			return "member/memberView";
		}
		return "forward:index?formpath=main2";
	}
	
	@RequestMapping(value="/memberModi")
	public String memberModi() {
		String sessionEmail = (String) session.getAttribute("email");
		MemberDTO member = service.memberViewProc(sessionEmail);
		session.setAttribute("nickname", member.getNickname());
		session.setAttribute("birth", member.getBirth());
		session.setAttribute("gender", member.getGender());
		return "member/memberModi";
	}
	
	@RequestMapping(value = "memberModiProc")
	public String memberModiProc(MemberDTO member, Model model) {
		member.setEmail((String)session.getAttribute("email"));
		int result = service.memberModiProc(member);
		if(result == 0) {
			model.addAttribute("msg", "필수 정보입니다.");
			return "member/memberModi";
		}else if(result == 1) {
			session.invalidate();
			model.addAttribute("msg", "수정되었습니다.");
			return "main2";
		}else {
			model.addAttribute("msg", "수정실패.");
			return "member/memberModi";
		}
	}
	@RequestMapping(value = "memberDeleteProc")
	public String memberDeleteProc(MemberDTO member) {
		member.setEmail((String)session.getAttribute("email"));
		boolean b = service.deleteProc(member);
		if(b == false)
			return "forward:/index?formpath=deleteForm";
		return "forward:memberViewProc";
	}
}
