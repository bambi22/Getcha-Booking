package com.hago.getcha.restManagement.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;

@Repository
public interface IRestInfoDAO {

	public RestaurantDTO selectRestaurant(int restNum);

	public ArrayList<OpenHourDTO> selectOpenHour(int restNum);

	public ArrayList<FacilitiesDTO> selectFacilities(int restNum);

	public ArrayList<RestImageDTO> selectRestImage(int restNum);

	public ArrayList<MenuDTO> selectMenu(int restNum);

	public ArrayList<WholeMenuDTO> selectWholeMenu(int restNum);


}
