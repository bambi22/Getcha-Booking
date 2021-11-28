package com.hago.getcha.Login.service;

import com.hago.getcha.Member.dto.MemberDTO;

public interface ILoginService {
	 /* 로그인 */
    public MemberDTO memberLogin(MemberDTO member) throws Exception;
}
