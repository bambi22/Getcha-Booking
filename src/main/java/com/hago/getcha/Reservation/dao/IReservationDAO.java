package com.hago.getcha.Reservation.dao;

import java.util.ArrayList;

import com.hago.getcha.Reservation.dto.ReservationDTO;

public interface IReservationDAO {

	public ArrayList<ReservationDTO> getTime(int restNum);

}
