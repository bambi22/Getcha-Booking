package com.hago.getcha.restManagement.dao;

import java.util.ArrayList;

import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;

public interface IRestManagementDAO {

	RestaurantDTO selectRestaurant(int restNum);

	ArrayList<OpenHourDTO> selectOpenHour(int restNum);

	ArrayList<FacilitiesDTO> selectFacilities(int restNum);

	ArrayList<RestImageDTO> selectRestImage(int restNum);

	ArrayList<MenuDTO> selectMenu(int restNum);

	ArrayList<WholeMenuDTO> selectWholeMenu(int restNum);

}
