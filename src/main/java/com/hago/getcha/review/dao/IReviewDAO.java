package com.hago.getcha.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.hago.getcha.review.dto.AllDTO;
import com.hago.getcha.review.dto.FileDTO;
import com.hago.getcha.review.dto.ReviewDTO;

@Repository
public interface IReviewDAO {
	public void writeProc(ReviewDTO dto);
	public ArrayList<AllDTO> reviewProc(String email);
	public ReviewDTO selectOne(int revieNum);
	public int deleteProc(int reviewNum);
	public void updateAvgPoint(int avgPoint);
	public String selectFile(int reviewNum);
	public void updateProc(ReviewDTO origin);
	public void updateFile(FileDTO fDto);
}
