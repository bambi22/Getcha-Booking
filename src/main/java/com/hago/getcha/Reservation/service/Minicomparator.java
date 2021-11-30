package com.hago.getcha.Reservation.service;

import java.util.Comparator;

import com.hago.getcha.Reservation.dto.ReservationDTO;

public class Minicomparator implements Comparator<ReservationDTO>{
	@Override
	public int compare(ReservationDTO o1, ReservationDTO o2) {
		int time1 = Integer.parseInt(o1.getResDay().replaceAll("[0-9]", ""));
		int time2 = Integer.parseInt(o2.getResDay().replaceAll("[0-9]", ""));
		System.out.print("time1:"+time1);
		System.out.print("time2:"+time2);
		if(time1 > time2) {
			return -1;
		}else if(time1 < time2) {
			return 1;
		}else {
			return 0;
		}
	}
}
