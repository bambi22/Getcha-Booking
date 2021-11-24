package com.hago.getcha.Member.service;

import javax.servlet.http.HttpSession;

import com.hago.getcha.Member.dto.MemberDTO;

public interface IMemberService {
	public String CheckEmail(String email);
	public String memberProc(MemberDTO member);
	public int memberDeleteProc(MemberDTO check);
	public MemberDTO memberViewProc(String email);
	public int memberModiProc(MemberDTO member);
	public MemberDTO memberLogin(MemberDTO member) throws Exception;
}
