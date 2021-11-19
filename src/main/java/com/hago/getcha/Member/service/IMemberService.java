package com.hago.getcha.Member.service;

import javax.servlet.http.HttpSession;

import com.hago.getcha.Member.dto.MemberDTO;

public interface IMemberService {
	public String CheckEmail(String email);
	public String memberProc(MemberDTO member);
	public boolean memberDeleteProc(MemberDTO check);
	public MemberDTO memberViewProc(String email);
	public int memberModiProc(MemberDTO member);
	//로그인 체크
	public boolean loginCheck(MemberDTO member,HttpSession session);
	//로그 아웃
	public void logout(HttpSession session);
}
