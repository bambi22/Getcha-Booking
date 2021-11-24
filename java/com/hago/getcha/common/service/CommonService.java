package com.hago.getcha.common.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.common.config.PageConfig;
import com.hago.getcha.config.PageCon;
import com.hago.getcha.restManagement.dao.IRestInfoDAO;
import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.review.dao.IReviewDAO;
import com.hago.getcha.review.dto.ReviewsDTO;

@Service
public class CommonService {
	@Autowired IRestInfoDAO infoDao;
	@Autowired IReviewDAO rDao;
	@Autowired HttpSession session;
	@Autowired PageCon page;
	
	public void restViewProc(String restNo, int currentPage, Model model, HttpServletRequest req) {
		restNo = "21";
		int restNum = Integer.parseInt(restNo);
		// 식당 정보 가져오기
		RestaurantDTO rest = infoDao.selectRestaurant(restNum);
		// 영업시간 가져오기
		ArrayList<OpenHourDTO> openList = infoDao.selectOpenHour(restNum);
		// 부대시설 가져오기
		ArrayList<FacilitiesDTO> facilityList = infoDao.selectFacilities(restNum);  
		// 식당 사진 가져오기
		ArrayList<RestImageDTO> restImgList = infoDao.selectRestImage(restNum);
		// 메뉴 가져오기
		ArrayList<MenuDTO> menuList = infoDao.selectMenu(restNum);
		// 메뉴판 가져오기
		//ArrayList<WholeMenuDTO> wholeMenuList = rmDao.selectWholeMenu(restNum);
		
		int totalCount = rDao.reviewCount(restNum);
		int pageBlock = 3; //한 화면에 보여줄 데이터 수
		int end = currentPage * pageBlock; //페이지별 게시글 끝 번호
		int begin = end+1 - pageBlock; //페이지별 게시글 시작 번호
		// 리뷰 가져오기
		ArrayList<ReviewsDTO> reviewList = rDao.selectAll(begin, end, restNum);
		
		model.addAttribute("rest", rest);
		model.addAttribute("openList", openList);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("restImgList", restImgList);
		model.addAttribute("menuList", menuList);
		//model.addAttribute("wholeMenuList", wholeMenuList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("cntReview", totalCount);
		
		String url = req.getContextPath()+"/restViewProc?restNum="+restNum+"&";
		url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
		System.out.println(totalCount);
		
	}

	public void restTypeListProc(String mode, String type, Model model) {
		ArrayList<RestaurantDTO> restList = null;
		if(mode.equals("type")) {
			if(type.equals("etc")) {
				restList = infoDao.restTypeEtcList();
			}else {
				restList= infoDao.restTypeList(type);						
			}
		}
		if(mode.equals("location")) {
			if(type.equals("etc")) {
				restList = infoDao.restLocationEtcList();
				for(RestaurantDTO rest : restList) {
					System.out.println(rest.getRestName());
				}
			}else {
				restList= infoDao.restLocationList(type);						
			}
		}
		model.addAttribute("restList", restList);
		
	}

	

}
