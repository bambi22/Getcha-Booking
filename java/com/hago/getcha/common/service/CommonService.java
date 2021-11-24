package com.hago.getcha.common.service;

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
	@Autowired IMemberDAO mDao;
	@Autowired ICollectionDAO cDao;
	@Autowired CollectDTO cDto;
	@Autowired HttpSession session;
	@Autowired PageCon page;
	
	public void restViewProc(String restNo, int currentPage, Model model, HttpServletRequest req) {
		int restNum = Integer.parseInt(restNo);
		// ?�당 ?�보 가?�오�??
		RestaurantDTO rest = infoDao.selectRestaurant(restNum);
		// ?�업?�간 가?�오�??
		ArrayList<OpenHourDTO> openList = infoDao.selectOpenHour(restNum);
		// 부?�??�설 가?�오�??
		ArrayList<FacilitiesDTO> facilityList = infoDao.selectFacilities(restNum);  
		// ?�당 ?�진 가?�오�??
		ArrayList<RestImageDTO> restImgList = infoDao.selectRestImage(restNum);
		// 메뉴 가?�오�??
		ArrayList<MenuDTO> menuList = infoDao.selectMenu(restNum);
		// 메뉴?? 가?�오�??
		//ArrayList<WholeMenuDTO> wholeMenuList = rmDao.selectWholeMenu(restNum);
		
		int totalCount = rDao.reviewCount(restNum);
		int pageBlock = 3; //?? ?�면?? 보여�?? ?�이?? ??
		int end = currentPage * pageBlock; //?�이지�?? 게시글 ?? 번호
		int begin = end+1 - pageBlock; //?�이지�?? 게시글 ?�작 번호
		// 리뷰 가?�오�??
		ArrayList<ReviewsDTO> reviewList = rDao.selectAll(begin, end, restNum);
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int cntCollection = cDao.collCount(restNum);
		int collection = cDao.collChck(cDto); // 1?�면 ?��? ?�??�함, 0?�면 ?�??�x
		
		model.addAttribute("rest", rest);
		model.addAttribute("openList", openList);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("restImgList", restImgList);
		model.addAttribute("menuList", menuList);
		//model.addAttribute("wholeMenuList", wholeMenuList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("cntReview", totalCount);
		model.addAttribute("restNum", restNum);
		model.addAttribute("collection", collection);
		model.addAttribute("cntCollection", cntCollection);
		
		String url = req.getContextPath()+"/restViewProc?restNum="+restNum+"&";
		url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
		System.out.println(totalCount);
	
	}
	
	public int colletProc(String restNo) {
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		int restNum = Integer.parseInt(restNo);
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int check = cDao.collChck(cDto);
		int result;
		if(check == 0) { // 중복?? ?�는 경우 db ?�??
			result = cDao.collectProc(cDto);
		}
		else result = 0; // ?�?? ?�패
		return result;
	}
	


	
	public int colletProc(String restNo) {
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		int restNum = Integer.parseInt(restNo);
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int check = cDao.collChck(cDto);
		int result;
		if(check == 0) { // 중복?? ?�는 경우 db ?�???
			result = cDao.collectProc(cDto);
		}
		else result = 0; // ?�??? ?�패
		return result;
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
