package com.hago.getcha.Member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.hago.getcha.Member.dto.memberDTO;

public interface IMemberService {
	public String CheckEmail(String email);
	public String memberProc(memberDTO member);
	public boolean deleteProc(memberDTO check);
	public memberDTO memberViewProc(String email);
	public int memberModiProc(memberDTO member);
}
