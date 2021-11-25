package com.hago.getcha.admin.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hago.getcha.admin.dto.AdditionDTO;
import com.hago.getcha.admin.dto.ManagerDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;


@Repository
public interface IAdminManagementDAO {

	public ManagerDTO selectId(String id);

	public void addManager(ManagerDTO managerDto);

	public ArrayList<RestaurantDTO> restList();

	public void addRestNum(String string);

	public void deleteManager(int restNum);

	public void deleteRestaurant(int restNum);

	public ArrayList<AdditionDTO> guideBookList();

	

}
