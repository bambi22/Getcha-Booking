package com.hago.getcha.common.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Repository
public interface IRestListDAO {

	
	public ArrayList<RestaurantDTO> restTypeList(String type);

	public ArrayList<RestaurantDTO> restTypeEtcList();

	public ArrayList<RestaurantDTO> restLocationList(String type);

	public ArrayList<RestaurantDTO> restLocationEtcList();

	public ArrayList<MenuDTO> selectPriceList(int start, int end);
}
