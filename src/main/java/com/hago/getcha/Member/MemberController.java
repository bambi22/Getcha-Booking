package com.hago.getcha.Member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hago.getcha.Member.dao.IMemberDAO;
import com.hago.getcha.Member.dto.MemberDTO;
import com.hago.getcha.Member.service.MemberService;

@Controller
public class MemberController {
	@Autowired IMemberDAO dao;
	@Autowired MemberService service;
	@Autowired HttpSession session;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	

	@RequestMapping(value="loginProc", method=RequestMethod.POST)
	public String loginProc(Model model, MemberDTO member){

		String rawPw = "";
		String encodePw = "";
		MemberDTO lvo = service.memberLogin(member);	
		if(lvo != null) {			
			rawPw = member.getPw();		
			encodePw = lvo.getPw();		
			
			if(true == pwEncoder.matches(rawPw, encodePw) || rawPw.equals(encodePw)) {		
				session.setAttribute("email", lvo.getEmail());	
				session.setAttribute("nickName", lvo.getNickname()); 	
				model.addAttribute("result", "로그인 성공");
				return "forward:index?formpath=main";					
			} else {
				model.addAttribute("result", "이메일과 비밀번호를 확인하십시오.");
				return "forward:index?formpath=login";					
			}			
		} else {				
			model.addAttribute("result", "이메일과 비밀번호를 확인하십시오.");
			return "forward:index?formpath=login";
		}
	}
	
    @RequestMapping(value="logout", method=RequestMethod.GET)
    
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession();
    	session.invalidate();
    	 return "redirect:index?formpath=main";
    }
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
		int result = service.memberProc(member);
		
		if(result == 0) {
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			//model.addAttribute("url","/memberModi");
			return "forward:index?formpath=member";
		}else if(result == 1) {
			session.invalidate();
			model.addAttribute("msg", "중복 아이디입니다.");
			//model.addAttribute("url","/main");
			return "forward:index?formpath=member";
		}else {
			model.addAttribute("msg", "가입완료");
			//model.addAttribute("url","/memberModi");
			return "forward:index?formpath=/main";
		}
	}
	@RequestMapping(value = "memberViewProc")
	public String memberViewProc(String email, Model model) {
		email = (String) session.getAttribute("email");
		String sessionEmail = (String)session.getAttribute("email");
		if(email==""||email==null||sessionEmail==""||sessionEmail==null) {
			return "forward:index?formpath=login";
		}
		if(sessionEmail.equals(email)) {
			service.memberViewProc(email,model);
			return "forward:index?formpath=memberView";
		}
		return "forward:index?formpath=main";
	}
	
	@RequestMapping(value="memberModiView", method = {RequestMethod.POST, RequestMethod.GET})
	public String memberModiView(String email, Model model) {
		email = (String)session.getAttribute("email");
		logger.warn("email:"+email);
		service.memberViewProc(email,model);
		return "forward:index?formpath=memberModi";
	}
	
	final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	@RequestMapping(value = "memberModiProc", method = {RequestMethod.POST, RequestMethod.GET})
	public String memberModiProc(MemberDTO member, Model model, HttpSession session) {
		member.setEmail((String)session.getAttribute("email"));
		MemberDTO memberView = dao.memberViewProc(member.getEmail());
		String birth = memberView.getBirth();
		String gender=memberView.getGender();
		member.setBirth(birth);
		member.setGender(gender);
		int result = service.memberModiProc(member);
		
		if(result == 0) {
			model.addAttribute("msg", "필수 정보입니다.");
			//model.addAttribute("url","/memberModi");
			return "forward:index?formpath=memberModi";
		}else if(result == 1) {
			session.invalidate();
			model.addAttribute("msg", "수정되었습니다.");
			//model.addAttribute("url","/main");
			return "forward:index?formpath=main";
		}else {
			model.addAttribute("msg", "수정실패.");
			//model.addAttribute("url","/memberModi");
			return "forward:index?formpath=/memberModi";
		}
	}
	@RequestMapping(value = "memberDeleteProc")
	public String memberDeleteProc(MemberDTO member, Model model) {
		String email = (String) session.getAttribute("email");
		member.setEmail(email);
		int result = service.memberDeleteProc(member);
		if(result == 0) {
			model.addAttribute("msg", "입력한 두 비밀번호가 일치하지 않습니다.");
			//model.addAttribute("url","/");
			return "forward:index?formpath=deleteForm";
		}else if(result == 1) {
			model.addAttribute("msg","삭제되었습니다.");
			session.invalidate();
			//model.addAttribute("url","/");
			return "forward:index?formpath=main";
		}else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			//model.addAttribute("url","/");
			return "forward:index?formpath=deleteForm";
		}
	}
	
	@RequestMapping(value = "sendAuth")
	public Map<String, String> sendAuth(@RequestBody Map<String, String>map){
		logger.warn(map.get("email"));
		Boolean check = (Boolean)session.getAttribute("authState");
		if(check != null && check ==true) {
			map.put("msg", "인증 완료");
			return map;
		}
		service.sendAuth((String)map.get("email"));
		map.put("msg", "이메일을 확인하세요.");
		return map;
	}
	
	@RequestMapping(value = "authConfirm")
	public Map<String, String> authConfirm(@RequestBody Map<String, String>map){
		Boolean check = (Boolean)session.getAttribute("authState");
		if(check != null&& check == true) {
			map.put("msg", "인증 완료");
			return map;
		}
		map.put("msg", service.authConfirm(map.get("c")));
		return map;
	}
}
