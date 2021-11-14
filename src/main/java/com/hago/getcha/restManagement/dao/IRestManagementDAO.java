package com.hago.getcha.restManagement.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hago.getcha.restManagement.dto.FacilitiesDTO;
import com.hago.getcha.restManagement.dto.OpenHourDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Repository
public interface IRestManagementDAO {
	public void restRegister(RestaurantDTO restDto);

	public void addFacilities(FacilitiesDTO facilDto);

	public void addOpenHour(OpenHourDTO openDto);

}
