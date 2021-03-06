package com.hago.getcha.common.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hago.getcha.admin.dto.AdditionDTO;
import com.hago.getcha.restManagement.dto.MenuDTO;
import com.hago.getcha.restManagement.dto.RestaurantDTO;
import com.hago.getcha.review.dto.ReviewCountDTO;

@Repository
public interface IRestListDAO {

	
	public ArrayList<RestaurantDTO> restTypeList(String type);

	public ArrayList<RestaurantDTO> restTypeEtcList();

	public ArrayList<RestaurantDTO> restLocationList(String type);

	public ArrayList<RestaurantDTO> restLocationEtcList();

	public ArrayList<MenuDTO> selectPriceList(int start, int end);

	public ArrayList<AdditionDTO> guideBookShowList(String guideBook);

	public ArrayList<ReviewCountDTO> reviewCountProc();

	public int restReviewCountProc(int restNum);
}
