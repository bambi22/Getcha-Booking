package com.hago.getcha.Login.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hago.getcha.Member.dao.IMemberDAO;
import com.hago.getcha.Member.dto.MemberDTO;


public class LoginServiceImpl implements ILoginService{
	@Autowired
	IMemberDAO membermapper;
	
	/*로그인*/
	@Override
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		
		 return membermapper.memberLogin(member);
	}

}
