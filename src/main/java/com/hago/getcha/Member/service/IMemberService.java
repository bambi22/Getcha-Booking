package com.hago.getcha.Member.service;


import javax.servlet.http.HttpSession;

import com.hago.getcha.Member.dto.memberDTO;

public interface IMemberService {
	public String CheckEmail(String email);
	public String memberProc(memberDTO member);
	public boolean deleteProc(memberDTO check);
	public memberDTO memberViewProc(String email);
	public int memberModiProc(memberDTO member);
	//로그인 체크
	public boolean loginCheck(memberDTO member,HttpSession session);
	//로그 아웃
	public void logout(HttpSession session);
}
