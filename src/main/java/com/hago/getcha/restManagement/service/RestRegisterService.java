package com.hago.getcha.restManagement.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.restManagement.dao.IRestInfoDAO;
import com.hago.getcha.restManagement.dao.IRestRegisterDAO;
import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;

@Service
public class RestRegisterService implements IRestRegisterService {
	@Autowired IRestRegisterDAO rrDao;
	@Autowired IRestInfoDAO infoDao;
	@Autowired HttpSession session;
	
	public String saveFile(int restNum, MultipartFile file, String location) {
		Calendar cal = Calendar.getInstance(); 	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileName = restNum+ "-"+sdf.format(cal.getTime()) + "-" + file.getOriginalFilename();
		File save = new File(location + "\\" + fileName);	//경로 지정 + 저장할 파일명 넣어줌
		try {
			file.transferTo(save);				// 그 위치에 저장해줌
		} catch (Exception e) {
			e.printStackTrace();
		} 	
		return fileName;
	}
	
	
	
	public void restRegisterProc(String[] facilities, String[] openHour, MultipartHttpServletRequest req) {
		int restNum = (Integer)session.getAttribute("restNum");
		
		// 멀티파트으로 가져온 식당 정보를 테이블에 저장
		RestaurantDTO restDto = new RestaurantDTO();
		restDto.setRestNum(restNum);
		restDto.setRestName(req.getParameter("restName"));
		restDto.setRestIntro(req.getParameter("restIntro"));
		restDto.setZipcode(req.getParameter("zipcode"));
		
		String[] addrStr = req.getParameterValues("address");
		restDto.setAddress(addrStr[0] + " ," + addrStr[1]);
		restDto.setDong(req.getParameter("dong"));
		
		String[] typeStr = req.getParameterValues("type");
		if(typeStr[0].equals("direct")) 
			restDto.setType(typeStr[1]);
		else
			restDto.setType(typeStr[0]);
		restDto.setCapacity(Integer.parseInt(req.getParameter("capacity")));
		
		// 프로모션 파일 가져와서 저장
		MultipartFile file = req.getFile("promotion");
		if(file.getSize() != 0) {		
			String fileName = saveFile(restNum, file, FILE_LOCATION_PROMOTION);
			restDto.setPromotion(fileName);   
		}else {
			restDto.setPromotion("파일 없음");
		}
		rrDao.addRestaurant(restDto);
		
		
		// 부대 시설 저장
		if(facilities != null) {
			for(String facility : facilities) {
				FacilitiesDTO facilDto = new FacilitiesDTO();
				facilDto.setRestNum(restDto.getRestNum());
				facilDto.setFacility(facility);
			rrDao.addFacilities(facilDto);
			}			
		}
		
		// 운영 시간 저장
		for(String openStr : openHour) {
			OpenHourDTO openDto = new OpenHourDTO();
			String[] open = openStr.split(" ");
			openDto.setRestNum(restDto.getRestNum());
			if(open.length == 2) {
				openDto.setWeekSelection(open[0]);
				openDto.setDaySelection("");
				openDto.setHours(open[1]);
			}else {
				openDto.setWeekSelection(open[0]);
				openDto.setDaySelection(open[1]);
				openDto.setHours(open[2]);				
			}
			rrDao.addOpenHour(openDto);
		}
		
		// 넘어온 식당 사진들 저장
		List<MultipartFile> files = req.getFiles("restImage");
		if(files != null) {
			int i = 1;
			for(MultipartFile f : files) {
				RestImageDTO imgDto = new RestImageDTO();
				if(f.getSize() != 0) {		
					String fileName = saveFile(restNum, f, FILE_LOCATION_RESTAURANT);
					imgDto.setRestNum(restNum);
					imgDto.setRestImage(fileName);   
				}else {
					imgDto.setRestImage("파일 없음");
				}
				rrDao.addRestImage(imgDto);
				if(f.getSize() != 0 && i==1) {
					rrDao.addRepresentImage(imgDto);
				}
				i++;
			}
		}
	}

	
	
	public void menuRegisterProc(MultipartHttpServletRequest req) {	
		String inputOrNot = req.getParameter("inputOrNot");
		int restNum = (Integer)session.getAttribute("restNum");
		if(inputOrNot.equals("yes")) {
			String[] categoryStr = req.getParameterValues("category"); 
			String[] menuNameStr = req.getParameterValues("menuName"); 
			String[] menuDescriptStr = req.getParameterValues("menuDescript"); 
			String[] unitPriceStr = req.getParameterValues("unitPrice"); 
			List<MultipartFile> files = req.getFiles("menuImage");
			
			int i= 0;
			for(String menuName : menuNameStr) {
				MenuDTO menuDto = new MenuDTO();
				menuDto.setRestNum((Integer)session.getAttribute("restNum"));
				menuDto.setCategory(categoryStr[i]);	
				menuDto.setMenuName(menuName);
				menuDto.setMenuDescript(menuDescriptStr[i]);
				menuDto.setUnitPrice(Integer.parseInt(unitPriceStr[i]));
			    if(!files.get(i).isEmpty()) { 
				    String fileName = saveFile(restNum, files.get(i), FILE_LOCATION_MENU);
				    menuDto.setMenuImage(fileName); 
			    }else { 
				    menuDto.setMenuImage("파일 없음"); 
		        }
				
			    rrDao.addMenu(menuDto);
				
				i++;
			}
		}
	    
	    
	    List<MultipartFile> files = req.getFiles("wholeMenu");
		if(files != null) {
			for(MultipartFile f : files) {
				WholeMenuDTO menuDto = new WholeMenuDTO();
				menuDto.setRestNum(restNum);
				if(!f.isEmpty()) { 
				    String fileName = saveFile(restNum, f, FILE_LOCATION_WHOLEMENU);
				    menuDto.setWholeMenu(fileName);   
				}else {
					menuDto.setWholeMenu("파일 없음");   
				}
				rrDao.addWholeMenu(menuDto);
			}
		}
		
	}



	public int restMainProc(Model model) {
		int restNum = (Integer)session.getAttribute("restNum");
		RestaurantDTO restDto = infoDao.selectRestaurant(restNum);
		if(restDto.getRestName() != null) {
			model.addAttribute("restDto", restDto);
			return 1;
		}else {
			model.addAttribute("msg", "식당 정보를 먼저 등록하세요.");
			return 0;			
		}
	}
}
