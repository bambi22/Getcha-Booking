package com.hago.getcha.Reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hago.getcha.Reservation.dto.ReservationDTO;
import com.hago.getcha.Reservation.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired HttpSession session;
	@Autowired ReservationService service;
	Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value = "getTime", method = RequestMethod.POST)
	@ResponseBody
	public List<ReservationDTO> returnMap(){
		logger.warn("controller");
		session.setAttribute("restNum", 1);
		int restNum = (int) session.getAttribute("restNum");
		List<ReservationDTO>list = service.getTime(restNum);
		return list;
	}
}
