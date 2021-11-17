package com.hago.getcha.restManagement.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.restManagement.RestManagementController;
import com.hago.getcha.restManagement.dao.IRestManagementDAO;
import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Service
public class RestRegisterService implements IRestRegisterService {
	@Autowired IRestManagementDAO rmDao;
	@Autowired HttpSession session;
	private static final Logger logger = LoggerFactory.getLogger(RestManagementController.class);
	
	
	public void restRegisterProc(String[] facilities, String[] openHour, MultipartHttpServletRequest req) {
		// 세션값 추가
		session.setAttribute("restNum", 30);
		
		// 멀티파트으로 가져온 식당 정보를 테이블에 저장
		RestaurantDTO restDto = new RestaurantDTO();
		restDto.setRestNum((Integer)session.getAttribute("restNum"));
		restDto.setRestName(req.getParameter("restName"));
		restDto.setRestIntro(req.getParameter("restIntro"));
		restDto.setZipcode(req.getParameter("zipcode"));
		
		String[] addrStr = req.getParameterValues("address");
		restDto.setAddress(addrStr[0] + addrStr[1]);
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
			Calendar cal = Calendar.getInstance(); 	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileName = sdf.format(cal.getTime()) + file.getOriginalFilename();
			restDto.setPromotion(fileName);   
			File save = new File(FILE_LOCATION_PROMOTION + "\\" + fileName);	//경로 지정 + 저장할 파일명 넣어줌
			try {
				file.transferTo(save);				// 그 위치에 저장해줌
			} catch (Exception e) {
				e.printStackTrace();
			} 				
		}else {
			restDto.setPromotion("파일 없음");
		}
		rmDao.restRegister(restDto);
		
		
		// 부대 시설 저장
		if(facilities != null) {
			for(String facility : facilities) {
				FacilitiesDTO facilDto = new FacilitiesDTO();
				facilDto.setRestNum(restDto.getRestNum());
				facilDto.setFacility(facility);
			rmDao.addFacilities(facilDto);
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
			rmDao.addOpenHour(openDto);
		}
		
		// 넘어온 식당 사진들 저장
		List<MultipartFile> files = req.getFiles("restImage");
		Calendar cal = Calendar.getInstance(); 	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		if(files != null) {
			int i = 1;
			for(MultipartFile f : files) {
				RestImageDTO imgDto = new RestImageDTO();
				imgDto.setRestNum(restDto.getRestNum());
				String fileName = i+ "-" + sdf.format(cal.getTime()) + f.getOriginalFilename();
				imgDto.setRestImage(fileName);   
				File save = new File(FILE_LOCATION_RESTAURANT + "\\" + fileName);	//경로 지정 + 저장할 파일명 넣어줌
				try {
					f.transferTo(save);				// 그 위치에 저장해줌
				} catch (Exception e) {
					e.printStackTrace();
				} 
				i++;
				rmDao.addRestImage(imgDto);
			}
		}else {
			restDto.setPromotion("파일 없음");
		}
	}

	
	
	public void menuRegisterProc(MultipartHttpServletRequest req) {
		int restNum = (Integer)session.getAttribute("restNum");
		logger.warn("식당 번호" + Integer.toString(restNum));
		
		String[] categoryStr = req.getParameterValues("category");
		String[] menuNameStr = req.getParameterValues("menuName");
		String[] menuDescriptStr = req.getParameterValues("menuDescript");
		String[] unitPriceStr = req.getParameterValues("unitPrice");
		List<MultipartFile> files = req.getFiles("menuImage");
		for(int i=0; i < menuNameStr.length; i++) {
			MenuDTO menuDto = new MenuDTO();
			menuDto.setRestNum(restNum);
			menuDto.setCategory(categoryStr[i]);
			menuDto.setMenuName(menuNameStr[i]);
			menuDto.setMenuDescript(menuDescriptStr[i]);
			menuDto.setUnitPrice(Integer.parseInt(unitPriceStr[i]));
			if(files != null) {
				String fileName = menuNameStr[i] + files.get(i).getOriginalFilename();
				menuDto.setMenuImage(fileName);
				File save = new File(FILE_LOCATION_MENU + "\\" + fileName);
				try {
					files.get(i).transferTo(save);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				menuDto.setMenuImage("파일 없음");
			}
			rmDao.addMenu(menuDto);
		}
		
	}
}
