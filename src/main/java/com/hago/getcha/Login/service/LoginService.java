package com.hago.getcha.Login.service;

import com.hago.getcha.Member.dto.MemberDTO;

public interface LoginService {
	 /* 로그인 */
    public MemberDTO memberLogin(MemberDTO member) throws Exception;
}
