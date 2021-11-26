package com.hago.getcha.Reservation.dao;

import java.util.ArrayList;

import com.hago.getcha.Reservation.dto.ReservationDTO;

public interface IReservationDAO {

	public ArrayList<ReservationDTO> getTime(int restNum);
	public ReservationDTO getInfo(int restNum);
	public ArrayList<ReservationDTO> getresList(int restNum);
	public int reservationProc(ReservationDTO dto);
	public ArrayList<ReservationDTO> reservationView(String email);
	public int resDeleteProc(int resNum);
	public String userinfo(String email);
	public ReservationDTO deleteView(int restNum);
}
