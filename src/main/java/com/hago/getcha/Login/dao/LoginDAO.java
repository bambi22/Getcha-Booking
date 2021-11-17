package com.hago.getcha.Login.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hago.getcha.Member.dto.memberDTO;

@Repository
	public class LoginDAO {

		@Autowired
		SqlSession sqlSession;
		
		//로그인 체크
		public boolean loginCheck(memberDTO member) {
			System.out.println("===> Mybatis로 loginCheck() 기능 처리");
			String name = sqlSession.selectOne("memberMapper.loginCheck",member);
			
			return (Integer.parseInt(name)==0)?false:true;
		}
		
		//로그 아웃
		public void logout(HttpSession session) {
			System.out.println("===> 로그아웃 기능 처리");
			session.invalidate();
		}
}
