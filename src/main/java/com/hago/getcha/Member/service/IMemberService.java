package com.hago.getcha.Member.service;

import com.hago.getcha.Member.dto.MemberDTO;

public interface IMemberService {
	public String CheckEmail(String email);
	public String memberProc(MemberDTO member);
	public boolean deleteProc(MemberDTO check);
	public MemberDTO memberViewProc(String email);
	public int memberModiProc(MemberDTO member);
}
