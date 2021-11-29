package com.hago.getcha.Reservation;

import java.util.ArrayList;
import java.util.Collections;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hago.getcha.Reservation.dao.IReservationDAO;
import com.hago.getcha.Reservation.dto.ReservationDTO;
import com.hago.getcha.Reservation.service.Minicomparator;
import com.hago.getcha.Reservation.service.ReservationService;

@Controller
public class ReservationController{
	@Autowired HttpSession session;
	@Autowired ReservationService service;
	@Autowired IReservationDAO dao;
	Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value="/calendarProc")
	public String calendarProc(@RequestParam String restNum, Model model) {
		logger.warn("restNum:"+restNum);
		int restnum = Integer.parseInt(restNum);
		session.setAttribute("restNum", restnum);
		ArrayList<String> weekList = service.allList(restnum);
		ReservationDTO info = service.getInfo(restnum);
		String restName = info.getRestName();
		ArrayList<ReservationDTO> resList = service.resList(restnum);
		if(weekList.isEmpty()||resList.isEmpty()||info==null) {
			return "forward:index?formpath=calendar";
		}
		model.addAttribute("restName", restName);
		model.addAttribute("weekList", weekList);
		model.addAttribute("restList", resList);
		model.addAttribute("info", info);
		return "forward:index?formpath=calendar";
	}
	
	@RequestMapping(value = "SearchDay", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> SearchDay(@RequestBody Map<String, String>map) throws Exception{
		logger.warn("controller");
		int restNum = (int) session.getAttribute("restNum");
		session.setAttribute("restNum", restNum);
		String date = (String)map.get("resDay");
		List<Map<String, Object>> dataList = service.checkAjax(date, restNum);
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
			//model.addAttribute("msg","로그인해주세요.");
			return "login";
		}else if(result == 1) {
			//model.addAttribute("msg","예약되었습니다.");
			return "forward:main";
		}else {
			//model.addAttribute("msg", "예약 실패");
			return "forward:index?formpath=calendar";
		}
	}
	
	@RequestMapping(value = "/reservationViewProc")
	public String reservationViewProc(Model model, String email) {
		email = (String)session.getAttribute("email");
		logger.warn("email:"+email);
		ArrayList<ReservationDTO>reservationView = service.reservationView(email);
		logger.warn("service");
		if(reservationView==null) {
			return "forward:index?formpath=calendar";
		}else {
			/*logger.warn("=====정렬=====");
			Minicomparator comp = new Minicomparator();
			Collections.sort(reservationView, comp);
			for(int i =0; i<reservationView.size(); i++) {
				ReservationDTO dto = reservationView.get(i);
				logger.warn("예약일:"+dto.getResDay());
			}*/
			model.addAttribute("reservationView",reservationView);
			return "forward:index?formpath=reservationView";
		}
	}
	
	@RequestMapping(value="resDelete")
	public String resDelete(String resNum, Model model) {
		logger.warn("1.resNumChek:"+resNum);
		service.resDelete(resNum, model);
		return "forward:index?formpath=deleteReservation";
	}
	
	@RequestMapping(value = "/DeleteProc")
	public String DeleteProc(String resNum, Model model, HttpSession session) {
		logger.warn("resNum:"+resNum);
		int result = service.resDeleteProc(resNum);
		if(result == 1) {
			model.addAttribute("msg", "취소되었습니다.");
			return "forward:index?formpath=main";
		}else {
			model.addAttribute("msg", "취소실패하였습니다.");
			return "forward:index?formpath=deleteReservation";
		}
	}
}
