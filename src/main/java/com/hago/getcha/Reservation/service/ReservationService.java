package com.hago.getcha.Reservation.service;

import java.util.ArrayList;

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
	public ArrayList<ReservationDTO> getTime(int restNum) {
		
		logger.warn("service");
		//restNum=(int) session.getAttribute("restNum");
		String checkNum = String.valueOf(restNum);
		logger.warn(checkNum);
		ArrayList<ReservationDTO> timeList = dao.getTime(restNum);
		logger.warn("dao");
		for(int i=0; i<timeList.size(); i++) {
			ReservationDTO time = timeList.get(i);
			String weekselection = time.getWeekselection();
			logger.warn("week: " + weekselection);
			String hours = time.getHours();
			logger.warn("hours:"+hours);
		}
		return timeList;
	}

}
