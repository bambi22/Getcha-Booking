package com.hago.getcha.Login.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.Member.dto.MemberDTO;

@Repository
public interface ILoginDAO {

	public int loginCheck(MemberDTO member);

}
