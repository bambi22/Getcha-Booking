package com.hago.getcha.Login.dao;

import org.springframework.stereotype.Repository;
import com.hago.getcha.Member.dto.memberDTO;

@Repository
public interface ILoginDAO {

	public int loginCheck(memberDTO member);

}
