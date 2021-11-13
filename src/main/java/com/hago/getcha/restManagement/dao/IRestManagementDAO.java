package com.hago.getcha.restManagement.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.restManagement.dto.RestaurantDTO;

@Repository
public interface IRestManagementDAO {
	public void restRegister(RestaurantDTO restDto);
}
