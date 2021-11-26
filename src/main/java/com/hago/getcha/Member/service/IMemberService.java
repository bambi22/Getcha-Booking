package com.hago.getcha.Member.service;

import org.springframework.ui.Model;

import com.hago.getcha.Member.dto.MemberDTO;

public interface IMemberService {
	public String CheckEmail(String email);
	public String memberProc(MemberDTO member);
	public int memberDeleteProc(MemberDTO check);
	public void memberViewProc(String email, Model model);
	public int memberModiProc(MemberDTO member);
	public MemberDTO memberLogin(MemberDTO member) throws Exception;
	public void sendAuth(String email);
	public String authConfirm(String authNum);
}
