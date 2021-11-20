package com.hago.getcha.restManagement.service;


import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.restManagement.dao.IRestManagementDAO;
import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;

@Service
public class RestManagementService implements IRestManagementService {
	@Autowired HttpSession session;
	@Autowired IRestManagementDAO rmDao;
	
	@Override
	public void restInfo(Model model) {
		//int restNum = (Integer)session.getAttribute("restNum");
		int restNum = 33;
		// 식당 정보 가져오기
		RestaurantDTO rest = rmDao.selectRestaurant(restNum);
		// 영업시간 가져오기
		ArrayList<OpenHourDTO> openList = rmDao.selectOpenHour(restNum);
		// 부대시설 가져오기
		ArrayList<FacilitiesDTO> facilityList = rmDao.selectFacilities(restNum);  
		// 식당 사진 가져오기
		ArrayList<RestImageDTO> restImgList = rmDao.selectRestImage(restNum);
		// 메뉴 가져오기
		ArrayList<MenuDTO> menuList = rmDao.selectMenu(restNum);
		// 메뉴판 가져오기
		ArrayList<WholeMenuDTO> wholeMenuList = rmDao.selectWholeMenu(restNum);
		
		model.addAttribute("rest", rest);
		model.addAttribute("openList", openList);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("restImgList", restImgList);
		model.addAttribute("menuList", menuList);
		DecimalFormat formatter = new DecimalFormat("###,###");
		for(MenuDTO menu : menuList) {
			menu.setPriceStr(formatter.format(menu.getUnitPrice())+" 원");
		}
		model.addAttribute("wholeMenuList", wholeMenuList);
		
	}
	
}
