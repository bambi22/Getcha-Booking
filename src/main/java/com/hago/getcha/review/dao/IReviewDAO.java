package com.hago.getcha.review.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hago.getcha.review.dto.AllDTO;
import com.hago.getcha.review.dto.ReviewDTO;

@Repository
public interface IReviewDAO {
	public void writeProc(ReviewDTO dto);
	public ArrayList<AllDTO> reviewProc(String email);
	public void updateAvgPoint(int avgPoint);
	public int deleteProc(int reviewNum);
}
