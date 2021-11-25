package com.hago.getcha.common.service;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.Member.dao.IMemberDAO;
import com.hago.getcha.collection.dto.CollectDTO;
import com.hago.getcha.collection.dao.ICollectionDAO;
import com.hago.getcha.common.config.PageConfig;
import com.hago.getcha.common.dao.IRestListDAO;
import com.hago.getcha.config.PageCon;
import com.hago.getcha.restManagement.dao.IRestInfoDAO;
import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;
import com.hago.getcha.review.dao.IReviewDAO;
import com.hago.getcha.review.dto.ReviewsDTO;

@Service
public class CommonService {
	@Autowired IRestInfoDAO infoDao;
	@Autowired IReviewDAO rDao;
	@Autowired IMemberDAO mDao;
	@Autowired ICollectionDAO cDao;
	@Autowired CollectDTO cDto;
	@Autowired HttpSession session;
	@Autowired PageCon page;
	@Autowired IRestListDAO listDao;
	
	public void restViewProc(String restNo, int currentPage, Model model, HttpServletRequest req) {
		int restNum = Integer.parseInt(restNo);

		RestaurantDTO rest = infoDao.selectRestaurant(restNum);
		ArrayList<OpenHourDTO> openList = infoDao.selectOpenHour(restNum);
		ArrayList<FacilitiesDTO> facilityList = infoDao.selectFacilities(restNum);  
		ArrayList<RestImageDTO> restImgList = infoDao.selectRestImage(restNum);
		ArrayList<MenuDTO> menuList = infoDao.selectMenu(restNum);
		ArrayList<WholeMenuDTO> wholeMenuList = infoDao.selectWholeMenu(restNum);
		
		int totalCount = rDao.reviewCount(restNum);
		int pageBlock = 3; //페이지당 표시 수
		int end = currentPage * pageBlock; //페이지당 끝번호
		int begin = end+1 - pageBlock; //페이지당 시작 번호
	
		ArrayList<ReviewsDTO> reviewList = rDao.selectAll(begin, end, restNum);
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int cntCollection = cDao.collCount(restNum); //관심 식당으로 저장된 총 수
		int collection = cDao.collChck(cDto); // 1 -> 저장된 식당, 0 -> 저장x
		
		model.addAttribute("rest", rest);
		model.addAttribute("openList", openList);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("restImgList", restImgList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("wholeMenuList", wholeMenuList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("cntReview", totalCount);
		model.addAttribute("restNum", restNum);
		model.addAttribute("collection", collection);
		model.addAttribute("cntCollection", cntCollection);
		
		String url = req.getContextPath()+"/restViewProc?restNum="+restNum+"&";
		url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}
	
	public int colletProc(String restNo) {
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		int restNum = Integer.parseInt(restNo);
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int check = cDao.collChck(cDto);
		int result;
		if(check == 0) { //중복 아닌 상태로 저장 진행
			result = cDao.collectProc(cDto); //저장 성공 시 1 반환
		}
		else result = 0; // 저장된 상태면 0 반환
		return result;
	}
	

	
	public void restTypeListProc(String mode, String type, Model model) {
		ArrayList<RestaurantDTO> restList = null;
		if(mode.equals("type")) {
			if(type.equals("etc")) {
				restList = listDao.restTypeEtcList();
			}else {
				restList= listDao.restTypeList(type);						
			}
		}
		if(mode.equals("location")) {
			if(type.equals("etc")) {
				restList = listDao.restLocationEtcList();
				for(RestaurantDTO rest : restList) {
					System.out.println(rest.getRestName());
				}
			}else {
				restList= listDao.restLocationList(type);						
			}
		}
		model.addAttribute("restList", restList);
		
	}

	public void restPriceListProc(String arrange, Model model) {
		ArrayList<MenuDTO> restList = null;
		
		if(arrange.equals("under3")) {
			restList = listDao.selectPriceList(0, 30000);
			inputCommonInfo(restList);
		}
		if(arrange.equals("under5")) {
			restList = listDao.selectPriceList(30000, 50000);
			inputCommonInfo(restList);
		}
		if(arrange.equals("under10")) {
			restList = listDao.selectPriceList(50000, 100000);
			inputCommonInfo(restList);
		}
		if(arrange.equals("upper10")) {
			restList = listDao.selectPriceList(100000, 100000);
			inputCommonInfo(restList);
		}		
		model.addAttribute("restList", restList);
		
	}
	
	public void inputCommonInfo(ArrayList<MenuDTO> restList) {
		for(MenuDTO menu : restList) {
			RestaurantDTO rest = infoDao.selectRestaurant(menu.getRestNum());
			menu.setRestName(rest.getRestName());
			menu.setRestIntro(rest.getRestIntro());
			menu.setDong(rest.getDong());
			menu.setAvgPoint(rest.getAvgPoint());
			menu.setType(rest.getType());
			menu.setRepresentImage(rest.getRepresentImage());
		}
	}
}
