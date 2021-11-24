package com.hago.getcha.collection.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.collection.dao.ICollectionDAO;
import com.hago.getcha.collection.dto.AllCollectDTO;
import com.hago.getcha.collection.dto.CollectDTO;

@Service
public class CollectionService {
	@Autowired ICollectionDAO cDao;
	@Autowired CollectDTO cDto;
	private HttpSession session;
	
	public int colletProc(String restNo) {
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		int restNum = Integer.parseInt(restNo);
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int check = cDao.collChck(cDto);
		int result;
		if(check == 0) { // 중복이 없는 경우 db 저장
			result = cDao.collectProc(cDto);
		}
		else result = 0; // 저장 실패
		return result;
	}

	public void myCollectProc(Model model) {
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		//ArrayList<AllCollectDTO> collectionList = cDao.myCollectProc(email);
		//model.addAttribute("collectionList", collectionList);
	}
}
