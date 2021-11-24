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
	@Autowired IRestInfoDAO rmDao;
	@Autowired IReviewDAO rDao;
	@Autowired IMemberDAO mDao;
	@Autowired ICollectionDAO cDao;
	private CollectDTO cDto = new CollectDTO();
	private HttpSession session;
	
	public void restViewProc(String restNo, int currentPage, Model model, HttpServletRequest req) {
		int restNum = Integer.parseInt(restNo);
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
		//ArrayList<WholeMenuDTO> wholeMenuList = rmDao.selectWholeMenu(restNum);
		
		int totalCount = rDao.reviewCount(restNum);
		int pageBlock = 3; //한 화면에 보여줄 데이터 수
		int end = currentPage * pageBlock; //페이지별 게시글 끝 번호
		int begin = end+1 - pageBlock; //페이지별 게시글 시작 번호
		// 리뷰 가져오기
		ArrayList<ReviewsDTO> reviewList = rDao.selectAll(begin, end, restNum);
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int cntCollection = cDao.collCount(restNum);
		int collection = cDao.collChck(cDto); // 1이면 이미 저장함, 0이면 저장x
		
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
	}
	
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
}
