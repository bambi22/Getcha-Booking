package com.hago.getcha.Reservation;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hago.getcha.Reservation.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired HttpSession session;
	@Autowired ReservationService service;
	Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value="/calendar")
	public String calendar() {
		return "member/calendar";
	}
	
	@RequestMapping(value = "SearchDay", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String>SearchDay(@RequestBody Map<String, String>map) throws Exception{
		logger.warn("controller");
		int restNum = 12;
		String date = (String)map.get("input_date");
		String result = service.checkAjax(date, restNum);
		map.put("result", result);
		return map;
	}
}
