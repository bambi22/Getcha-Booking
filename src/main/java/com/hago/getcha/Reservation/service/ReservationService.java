package com.hago.getcha.Reservation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hago.getcha.Reservation.dao.IReservationDAO;
import com.hago.getcha.Reservation.dto.ReservationDTO;

@Service
public class ReservationService {
	@Autowired IReservationDAO dao;
	@Autowired HttpSession session;
	Logger logger = LoggerFactory.getLogger(ReservationService.class);
	
	public String checkAjax(String date, int restNum) throws Exception {
		logger.warn("date:" + date);
		String yoil = getDateDay(date);
		logger.warn("요일:" + yoil);
		List<String> list = allList(restNum);
		logger.warn("리스트 확인:" + list.get(0));
		for(int i=0; list.size()<i; i++) {
			logger.warn("for문 확인 :" + list.get(i));
			String dayLabel = list.get(i);
			logger.warn("dayLabel :" + dayLabel);
			if(yoil.equals(dayLabel) == true) {
				logger.warn("일치 요일 :" + yoil);
			}
		}
		if(date == null || date == "") {
			return "전달실패";
		}
		return "전달완료";
	}
	
	public String getDateDay(String date) throws Exception {
		String day = "";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nDate = dateFormat.parse(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(nDate);
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);
		switch(dayNum) {
		case 1: day="일요일"; break;
		case 2: day="월요일"; break;
		case 3: day="화요일"; break;
		case 4: day="수요일"; break;
		case 5: day="목요일"; break;
		case 6: day="금요일"; break;
		case 7: day="토요일"; break;
		}
		return day;
	}
	
	public ArrayList<String> allList(int restNum){
		logger.warn("restNum : " + restNum);
		ArrayList<ReservationDTO> hourList = dao.getTime(restNum);
		ArrayList<String> weekList = new ArrayList<String>();
		for(int i=0; i<hourList.size(); i++) {
			ReservationDTO part = new ReservationDTO();
			part = hourList.get(i);
			weekList.add(part.getWeekselection());
		}
		return weekList;
	}
}
