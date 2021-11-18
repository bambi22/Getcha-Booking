package com.hago.getcha.Member.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.Member.dto.MemberDTO;

@Repository
public interface IMemberDAO {

	public void insertMember(MemberDTO member);

	public int CheckEmail(String email);

	public MemberDTO userPassword(String email);

	public void deleteProc(String modifyEmail);

	public MemberDTO memberViewProc(String email);

	public int memberModiProc(MemberDTO member);

}
