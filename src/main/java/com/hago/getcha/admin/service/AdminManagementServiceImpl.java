package com.hago.getcha.admin.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hago.getcha.admin.dao.IAdminManagementDAO;
import com.hago.getcha.admin.dto.AdditionDTO;
import com.hago.getcha.admin.dto.ManagerDTO;
import com.hago.getcha.config.PageCon;
import com.hago.getcha.restManagement.dao.IRestInfoDAO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Service
public class AdminManagementServiceImpl implements IAdminManagementService{
	@Autowired IAdminManagementDAO adminDao;
	@Autowired IRestInfoDAO infoDao;
	@Autowired HttpSession session;
	@Autowired PageCon page;
	@Value("#{prop['adminId']}")	private String adminId;
	@Value("#{prop['adminPw']}")	private String adminPw;
	
	
	@Override
	public int adminLoginProc(Model model, String id, String pw) {		
		//최고 관리자는 properties파일에 있는 값과 비교
		if(id.equals(adminId)) {
			if(pw.equals(adminPw)) {
				session.setAttribute("adminId", "관리자");
				model.addAttribute("msg", "로그인 성공.");
				return 2;
			}else{
				model.addAttribute("msg", "비밀번호가 틀렸습니다.");
				return 1;
			}
		}else {
			ManagerDTO managerDto = adminDao.selectId(id);
			if(managerDto!=null && managerDto.getRestId().equals(id)) {
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				if(encoder.matches(pw, managerDto.getRestPw())) {
					session.setAttribute("restId", id);
					session.setAttribute("restNum", managerDto.getRestNum());
					return 3;					
				}else {
					model.addAttribute("msg", "비밀번호가 틀렸습니다.");
					return 1;
				}
			}else {
				model.addAttribute("msg", "없는 아이디 입니다.");
				return 0;				
			}
			
		}
		
	}

	@Override
	public void adminLogoutProc(Model model) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
	}

	@Override
	public void managerListProc(Model model, String pageNumber) {

		ArrayList<RestaurantDTO> restList= adminDao.restList();
		if(pageNumber != null) {
			page.setPageNumber(pageNumber);
		}
		if(restList != null) {
			page.setRecord(restList.size());
		}
		model.addAttribute("restList", restList);
		model.addAttribute("page", page);
		
	}

	public HashMap<String, String> isExistId(HashMap<String, String> map) {
		ManagerDTO managerDto = adminDao.selectId(map.get("id"));
		if(managerDto == null) {
			map.put("id", map.get("id"));
			map.put("idMsg", "사용 가능한 아이디입니다.");
			return map;
		}else {
			map.put("id", map.get("id"));
			map.put("idMsg", "중복된 아이디입니다.");
			return map;
		}
		
	}
	
	@Override
	public HashMap<String, String> findRestaurant(HashMap<String, String> map) {
		RestaurantDTO restDto = infoDao.selectRestaurant(Integer.parseInt(map.get("keyword")));
		if(restDto != null) {
			map.put("resultNum", Integer.toString(restDto.getRestNum()));
			map.put("resultName", restDto.getRestName());
			map.put("resultType", restDto.getType());
			map.put("resultDong", restDto.getDong());
			map.put("resultAddr", restDto.getAddress());
			return map;
		}else {
			map.put("resultNum", "none");
			return map;
		}
	}
	

	public int managerRegisterProc(Model model, ManagerDTO managerDto, String pwOk, String[] phoneStr1, String[] phoneStr2) {
		
		if(managerDto.getRestId()==null || managerDto.getRestPw()==null || pwOk == null) {
			model.addAttribute("msg", "입력값 확인하십시오.");
			return 0;
		}else if(!managerDto.getRestPw().equals(pwOk)) {
			model.addAttribute("msg", "입력된 비밀번호가 일치하지 않습니다.");
			return 0;
		}else {
			if(!phoneStr1[1].equals("") && !phoneStr1[2].equals("")) {
				managerDto.setPhone1(phoneStr1[0] +"-"+ phoneStr1[1] +"-"+ phoneStr1[2]);				
			}else {
				managerDto.setPhone1("");
			}
			if(!phoneStr2[1].equals("") && !phoneStr2[2].equals("")) {
				managerDto.setPhone2(phoneStr2[0] +"-"+ phoneStr2[1] +"-"+ phoneStr2[2]);				
			}else {
				managerDto.setPhone2("");
			}
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String securePw = encoder.encode(managerDto.getRestPw());
			managerDto.setRestPw(securePw);
			adminDao.addManager(managerDto);
			adminDao.addRestNum(managerDto.getRestId());
			session.setAttribute("msg", "식당 관리자가 등록되었습니다.");
			return 1;
		}
		
	}

	@Override
	public void deleteManagerProc(String restNum) {
		int num = Integer.parseInt(restNum);
		adminDao.deleteManager(num);
		adminDao.deleteRestaurant(num);
	}

	@Override
	public void guideBookListProc(Model model) {
		ArrayList<AdditionDTO> guideList = adminDao.guideBookList();
		for(AdditionDTO guide : guideList) {
			RestaurantDTO rest = infoDao.selectRestaurant(guide.getRestNum());
			guide.setRestName(rest.getRestName());
			guide.setDong(rest.getDong());
			guide.setAvgPoint(rest.getAvgPoint());
		}
		int size = guideList.size();
		model.addAttribute("guideList", guideList);
		model.addAttribute("max", guideList.get(0).getGuideBook());
		model.addAttribute("min", guideList.get(size-1).getGuideBook());
		
	}

	public String addGuideBookProc(int restNum) {
		AdditionDTO addition = adminDao.selectRestNum(restNum);
		LocalDate now = LocalDate.now();
		String guideBook = Integer.toString(now.getYear());
		if(addition != null) {
			if(addition.getGuideBook()==null) {
				
				adminDao.updateGuide(restNum, guideBook);
				return "추가되었습니다.";
			}else {
				return "이미 추가된 식당입니다.";
			}
		}else {
			adminDao.addGuide(restNum, guideBook);
			return "추가되었습니다.";
		}
		
	}

	

	
	
	
}
