package com.hago.getcha.common.service;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.Member.dao.IMemberDAO;
import com.hago.getcha.admin.dao.IAdminManagementDAO;
import com.hago.getcha.admin.dto.AdditionDTO;
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
import com.hago.getcha.restManagement.dto.RestSumDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;
import com.hago.getcha.review.dao.IReviewDAO;
import com.hago.getcha.review.dto.ReviewCountDTO;
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
		int pageBlock = 3; //?�이지?? ?�시 ??
		int end = currentPage * pageBlock; //?�이지?? ?�번??
		int begin = end+1 - pageBlock; //?�이지?? ?�작 번호
	
		ArrayList<ReviewsDTO> reviewList = rDao.selectAll(begin, end, restNum);
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		cDto.setEmail(email);
		cDto.setRestNum(restNum);
		int cntCollection = cDao.collCount(restNum); //관?? ?�당?�로 ?�?�된 �? ??
		int collection = cDao.collChck(cDto); // 1 -> ?�?�된 ?�당, 0 -> ?�?�x
		
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
		if(check == 0) { //중복 ?�닌 ?�태�? ?�?? 진행
			result = cDao.collectProc(cDto); //?�?? ?�공 ?? 1 반환
		}
		else result = 0; // ?�?�된 ?�태�? 0 반환
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
		for(RestaurantDTO rest : restList) {
			int count = listDao.restReviewCountProc(rest.getRestNum());
			rest.setCount(count);
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
		
		for(RestaurantDTO rest : restList) {
			int count = listDao.restReviewCountProc(rest.getRestNum());
			rest.setCount(count);
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

	public void searchProc(Model model, HttpServletRequest req) {
		String keyword = req.getParameter("keyword");
		if(keyword == null) return;
		ArrayList<RestSumDTO> restList = infoDao.searchProc(keyword);
		for(RestSumDTO rest : restList) {
			int count = listDao.restReviewCountProc(rest.getRestNum());
			rest.setCount(count);
		}
		model.addAttribute("restList", restList);
	}

	public void guideBookShowListProc(Model model) {
		LocalDate now = LocalDate.now();
		String guideBook = Integer.toString(now.getYear());
		ArrayList<AdditionDTO> guideList = listDao.guideBookShowList(guideBook);
		for(AdditionDTO guide : guideList) {
			RestaurantDTO rest = infoDao.selectRestaurant(guide.getRestNum());
			guide.setRestName(rest.getRestName());
			guide.setRestIntro(rest.getRestIntro());
			guide.setDong(rest.getDong());
			guide.setAvgPoint(rest.getAvgPoint());
			guide.setType(rest.getType());
			guide.setRepresentImage(rest.getRepresentImage());
			int count = listDao.restReviewCountProc(guide.getRestNum());
			guide.setCount(count);
		}
		model.addAttribute("restList", guideList);
		
	}

	public void popularListProc(Model model) {
		ArrayList<ReviewCountDTO> countList = listDao.reviewCountProc();
		for(ReviewCountDTO dto : countList) {
			RestaurantDTO rest = infoDao.selectRestaurant(dto.getRestNum());
			dto.setRestName(rest.getRestName());
			dto.setRestIntro(rest.getRestIntro());
			dto.setDong(rest.getDong());
			dto.setAvgPoint(rest.getAvgPoint());
			dto.setType(rest.getType());
			dto.setRepresentImage(rest.getRepresentImage());
		}
		model.addAttribute("restList", countList);
	}
}
