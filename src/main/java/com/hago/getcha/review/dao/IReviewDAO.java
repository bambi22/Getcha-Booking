package com.hago.getcha.review.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.review.dto.ReviewDTO;

@Repository
public interface IReviewDAO {
	public void writeProc(ReviewDTO dto);
	public void updateAvgPoint(int avgPoint);
}
