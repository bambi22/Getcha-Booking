package com.hago.getcha.reservationManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hago.getcha.reservationManagement.service.ReservationManagementServiceImpl;

@Controller
public class ReservationManagementController {
	@Autowired ReservationManagementServiceImpl reserveService;
	
	@RequestMapping(value="selectRestReservationProc")
	public String selectRestReservationProc(Model model, String searchDate) {
		reserveService.selectRestReservation(model, searchDate);
		return "forward:restIndex?formpath=bookingManagement";
	}
	
	@RequestMapping(value="reserveConfirmProc")
	public String reserveConfirmProc(Model model, String resNum) {
		reserveService.reserveConfirmProc(model, Integer.parseInt(resNum));
		return "forward:selectRestReservationProc";
	}

	@RequestMapping(value="reserveCancelProc")
	public String reserveCancelProc(Model model, String resNum) {
		reserveService.reserveCancelProc(model, Integer.parseInt(resNum));
		return "forward:selectRestReservationProc";
	}

	@RequestMapping(value="noShowProc")
	public String noShowProc(Model model, String resNum) {
		reserveService.noShowProc(model, Integer.parseInt(resNum));
		return "forward:selectRestReservationProc";
	}
	@RequestMapping(value="customerSeatedProc")
	public String customerSeatedProc(Model model, String resNum) {
		reserveService.customerSeatedProc(model, Integer.parseInt(resNum));
		return "forward:selectRestReservationProc";
	}
	@RequestMapping(value="orderDoneProc")
	public String orderDoneProc(Model model, String resNum) {
		reserveService.orderDoneProc(model, Integer.parseInt(resNum));
		return "forward:selectRestReservationProc";
	}
	
}
