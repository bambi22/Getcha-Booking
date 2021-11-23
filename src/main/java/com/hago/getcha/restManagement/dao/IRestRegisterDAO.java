package com.hago.getcha.restManagement.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestImageDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.restManagement.dto.WholeMenuDTO;

@Repository
public interface IRestRegisterDAO {
	public void addRestaurant(RestaurantDTO restDto);

	public void addFacilities(FacilitiesDTO facilDto);

	public void addOpenHour(OpenHourDTO openDto);

	public void addRestImage(RestImageDTO imgDto);

	public void addMenu(MenuDTO menuDto);

	public void addWholeMenu(WholeMenuDTO menuDto);

	public void addRepresentImage(RestImageDTO imgDto);


}
