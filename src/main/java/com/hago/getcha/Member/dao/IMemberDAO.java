package com.hago.getcha.Member.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.Member.dto.memberDTO;

@Repository
public interface IMemberDAO {

	public void insertMember(memberDTO member);

	public int CheckEmail(String email);

	public memberDTO userPassword(String email);

	public void deleteProc(String modifyEmail);

	public memberDTO memberViewProc(String email);

	public int memberModiProc(memberDTO member);

}
