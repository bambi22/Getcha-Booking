package com.hago.getcha.Member.service;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hago.getcha.Login.dao.ILoginDAO;
import com.hago.getcha.Member.dao.IMemberDAO;
import com.hago.getcha.Member.dto.MemberDTO;

@Service
public class MemberService implements IMemberService{
	@Autowired IMemberDAO dao;
	@Autowired ILoginDAO loginDao;
	@Autowired HttpSession session;
	final static Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Override
	public String memberProc(MemberDTO member) {
		String birth=member.getBirth1()+"년" + member.getBirth2()+"월"+member.getBirth3()+"일";
		member.setBirth(birth);
		logger.warn("Birth : " + member.getBirth());
		if(member.getPw().equals(member.getPwCheck())==false)
			return "비밀번호가 일치하지 않습니다.";
		if(member.getEmail() == "" || member.getPw() == "")
			return "필수 정보입니다.";
		if(dao.CheckEmail(member.getEmail()) > 0)
			return "중복 아이디입니다.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		member.setPw(securePw);
		if("m".equals(member.getGender()) || "w".equals(member.getGender()) || member.getEmail() != null)
			dao.insertMember(member);
		session.setAttribute("email", member.getEmail());
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
				session.invalidate();
				return 1;
			}
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
	public MemberDTO memberViewProc(String email) {
		MemberDTO member = dao.memberViewProc(email);
		if(member != null) {
			session.setAttribute("nickname", member.getNickname());
			session.setAttribute("birth", member.getBirth());
			session.setAttribute("gender", member.getGender());
			return member;
		}
		return null;
	}
	

	@Override
	public int memberModiProc(MemberDTO member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(member.getPw());
		logger.warn("pw: " + member.getPw());
		logger.warn("birth : " + member.getBirth());
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
	public boolean loginCheck(MemberDTO member, HttpSession session) {
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
