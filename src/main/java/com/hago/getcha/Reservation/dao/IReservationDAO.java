package com.hago.getcha.Reservation.dao;

import java.util.ArrayList;

import com.hago.getcha.Reservation.dto.ReservationDTO;

public interface IReservationDAO {

	public ArrayList<ReservationDTO> getTime(int restNum);
	public ReservationDTO getInfo(int restNum);
	public ArrayList<ReservationDTO> getresList(int restNum);
	public int reservationProc(ReservationDTO dto);
}
