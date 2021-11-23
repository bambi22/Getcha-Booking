package com.hago.getcha.Reservation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hago.getcha.Reservation.dao.IReservationDAO;
import com.hago.getcha.Reservation.dto.ReservationDTO;
import com.hago.getcha.Reservation.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired HttpSession session;
	@Autowired ReservationService service;
	@Autowired IReservationDAO dao;
	Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value="/calendar")
	public String calendar(Model model) {
		int restNum = 15;
		ArrayList<String> weekList = service.allList(restNum);
		ReservationDTO info = service.getInfo(restNum);
		ArrayList<ReservationDTO> resList = service.resList(restNum);
		model.addAttribute("weekList", weekList);
		model.addAttribute("restList", resList);
		model.addAttribute("info", info);
		return "member/calendar";
	}
	
	@RequestMapping(value = "SearchDay", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> SearchDay(@RequestBody Map<String, String>map) throws Exception{
		logger.warn("controller");
		int restNum = 15;
		session.setAttribute("restNum", restNum);
		String email = "1";
		session.setAttribute("email", email);
		String date = (String)map.get("resDay");
		List<Map<String, String>> dataList = service.checkAjax(date, restNum);
		Map<String, Object>data2 = new HashMap<String, Object>();
		data2.put("datas", dataList);
		return data2;
	}
	
	@RequestMapping(value = "reservationProc")
	public String reservationProc(ReservationDTO dto, Model model) {
		dto.setRestNum((int)session.getAttribute("restNum"));
		dto.setEmail((String)session.getAttribute("email"));
		logger.warn("resDay:"+dto.getResDay());
		logger.warn("hours:"+dto.getHours());
		logger.warn("capa:"+dto.getCapacity());
		logger.warn("email:"+dto.getEmail());
		logger.warn("restNum:"+ dto.getRestNum());
		int result = service.reservationProc(dto);
		if(result == 0) {
			model.addAttribute("msg","로그인해주세요");
			return "login";
		}else if(result == 1) {
			model.addAttribute("msg","예약되었습니다.");
			return "forward:index?formpath=main2";
		}else {
			model.addAttribute("msg", "예약 실패");
			return "forward:index?formpath=/calendar";
		}
	}
}
