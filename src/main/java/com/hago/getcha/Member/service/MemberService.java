package com.hago.getcha.Member.service;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hago.getcha.Login.dao.ILoginDAO;
import com.hago.getcha.Member.dao.IMemberDAO;

import com.hago.getcha.Member.dto.memberDTO;

@Service
public class MemberService implements IMemberService{
	@Autowired IMemberDAO dao;
	@Autowired ILoginDAO loginDao;
	@Autowired HttpSession session;
	final static Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	
	

	@Override
	public String memberProc(memberDTO member) {
		String birth=member.getBirth1()+"년" + member.getBirth2()+"월"+member.getBirth3()+"일";
		member.setBirth(birth);
		logger.warn("Birth : " + member.getBirth());
		if(member.getEmail() == "" || member.getPw() == "")
			return "필수 정보입니다.";
		if(dao.CheckEmail(member.getEmail()) > 0)
			return "중복 아이디입니다.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		if("m".equals(member.getGender()) || "w".equals(member.getGender()) || member.getEmail() != null)
			dao.insertMember(member);
		return "가입완료";
	}
	
	
	public memberDTO pwCheck(memberDTO check) {
		if(check.getPw().equals(check.getPwCheck())==false)
			return null;
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		memberDTO login = dao.userPassword(check.getEmail());
		if(login == null || bpe.matches(check.getPw(), login.getPw()))
			return null;
		return login;
	}

	
	@Override
	public boolean deleteProc(memberDTO check) {
		String sessionEmail = (String)session.getAttribute("email");
		check.setEmail(sessionEmail);
		memberDTO login = pwCheck(check);
		if(login == null)
			return false;
		String modifyEmail = (String)session.getAttribute("modifyEmail");
		dao.deleteProc(modifyEmail);
		session.removeAttribute("modifyEmail");
		session.invalidate();
		return true;
	}
	

	@Override
	public memberDTO memberViewProc(String email) {
		memberDTO member = dao.memberViewProc(email);
		if(member != null) {
			return member;
		}
		return null;
	}
	

	@Override
	public int memberModiProc(memberDTO member) {
		if(member.getEmail() == "")
			return 0;
		if(dao.memberModiProc(member) == 1)
			return 1;
		else
			return 2;
	}


	@Override
	public String CheckEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean loginCheck(memberDTO member, HttpSession session) {
		int result = loginDao.loginCheck(member);
		if (result == 1) {	//true 일경우 세션 등록
			//세션 변수 등록
			session.setAttribute("email", member.getEmail());
			return true;
		}
		return false;
		
	}


	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}
}
