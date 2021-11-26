package com.hago.getcha.Member.service;


import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.Member.dao.IMemberDAO;
import com.hago.getcha.Member.dto.MemberDTO;

@Service
public class MemberService implements IMemberService{
	@Autowired IMemberDAO dao;
	@Autowired HttpSession session;
	final static Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Override
	public String memberProc(MemberDTO member) {
		String birth=member.getBirth1()+"년" + member.getBirth2()+"월"+member.getBirth3()+"일";
		member.setBirth(birth);
		logger.warn("Birth : " + member.getBirth());
		if(member.getPw().equals(member.getPwCheck())==false) {
			logger.warn("pw: " + member.getPw());
			logger.warn("pwCheck:"+ member.getPwCheck());
			return "비밀번호가 일치하지 않습니다.";
		}
			
		if(member.getEmail() == "" || member.getPw() == "")
			return "필수 정보입니다.";
		if(dao.CheckEmail(member.getEmail()) > 0)
			return "중복 아이디입니다.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		if("m".equals(member.getGender()) || "w".equals(member.getGender()) || member.getEmail() != null)
			dao.insertMember(member);
		//session.setAttribute("email", member.getEmail());
		return "가입완료";
	}

	public int pwCheck(MemberDTO member) {
		logger.warn("service pwCheck");
		logger.warn("이메일 : " + member.getEmail());
		if(member.getPw().equals(member.getPwCheck()) == false) {
			logger.warn("pw 불일치" + member.getPw() + member.getPwCheck());
			return 0;
		}
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		MemberDTO check = dao.userPassword(member.getEmail());
		logger.warn("service pwCheck2");
		if(check != null && encoder.matches(member.getPw(), check.getPw())) {
			if(dao.memberDeleteProc(check) == 1) {
				logger.warn("dao:"+Integer.toString(dao.memberDeleteProc(check)));
				session.invalidate();
				return 1;
			}
		}
		if(check == null) 
			logger.warn("check=null");
		if(encoder.matches(member.getPw(), check.getPw())==false)
			logger.warn("match false");
		//if(dao.memberChilDelete(check) != 1)
			//logger.warn("memberChilDelete!=1");
		if(dao.memberDeleteProc(check)!=1) {
			logger.warn("memberDeleteProc!=1");
		}
		return 2;
	}
	
	@Override
	public int memberDeleteProc(MemberDTO member) {
		logger.warn("service");
		int result = pwCheck(member);
		String r = String.valueOf(result);
		logger.warn("result : " + r);
		return result;
	}
	

	@Override
	public void memberViewProc(String email, Model model) {
		MemberDTO memberView = dao.memberViewProc(email);
		if(memberView != null) {
			model.addAttribute("memberView",memberView);
		}
	}
	

	@Override
	public int memberModiProc(MemberDTO member) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		logger.warn("pw: " + member.getPw());
		logger.warn("birth : " + member.getBirth());
		logger.warn("gender:" + member.getGender());
		logger.warn("nickname:"+member.getNickname());
		logger.warn("email:"+member.getEmail());
		member.setPw(securePw);
		if(member.getEmail() == "" || member.getPw()==""||member.getEmail()==null||member.getPw()==null)
			return 0;
		if(dao.memberModiProc(member) == 1)
			return 1;
		else
			return 2;
	}

	@Override
	public String CheckEmail(String email) {
		int count = dao.CheckEmail(email);
		if(count == 0)
			return "사용가능한 이메일";
		return "중복 이메일";
	}


	@Override
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		  return dao.memberLogin(member);
	
	}
	@Autowired MailService mailService;
	@Override
	public void sendAuth(String email) {
		String authNum = (String)session.getAttribute("authNum");
		if(authNum == null) {
			Random r = new Random();
			String randNum = String.format("%06d", r.nextInt(1000000));
			session.setAttribute("authNum", randNum);
			session.setMaxInactiveInterval(10);
			mailService.sendMail(email, "[인증번호]", randNum);
			logger.warn(randNum);
		}else
			logger.warn("인증번호 생성되어 있음");
	}

	@Override
	public String authConfirm(String inputAuthNum) {
		String sessionAuthNum = (String)session.getAttribute("authNum");
		if(sessionAuthNum == null) 
			return "인증번호를 생성하세요.";
		if(inputAuthNum == "")
			return "인증번호를 입력하세요.";
		if(inputAuthNum.equals(sessionAuthNum)) {
			session.setAttribute("authState", true);
			return "인증완료";
		}
		return "인증실패";
	}
}
