package com.hago.getcha.review.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.review.controller.ReviewController;
import com.hago.getcha.review.dao.IReviewDAO;
import com.hago.getcha.review.dto.ReviewDTO;


@Service
public class ReviewService {
	final static Logger logger = LoggerFactory.getLogger(ReviewService.class);
	@Autowired HttpSession session;
	@Autowired IReviewDAO dao;
	String FILE_LOCATION = "C:\\java_folder\\upload";
	
	public void writeProc(MultipartHttpServletRequest req) {
		//String writer = (String) session.getAttribute("email");
		String content = req.getParameter("content");
		String restaurantNum = req.getParameter("restNum");
		String points = req.getParameter("point");
		int restNum = Integer.parseInt(restaurantNum);
		int point = Integer.parseInt(points);
		
		ReviewDTO dto = new ReviewDTO();
		dto.setEmail("test21@hago.com");
		dto.setContent(content);
		dto.setRestNum(restNum);
		dto.setPoint(point);
		dto.setLikes(0);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setWriteDate(sdf.format(date));
		
		StringBuilder builder = new StringBuilder();
		String fileName="";
		Iterator<String> files = req.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			
			MultipartFile mFile = req.getFile(uploadFile);
			if(mFile.getSize() != 0) {
				Calendar cal = Calendar.getInstance();
				sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
				fileName = sdf.format(cal.getTime()) + mFile.getOriginalFilename();
				System.out.println("파일 이름: " + fileName);
				File save = new File(FILE_LOCATION + "\\" + fileName);
				try {
					mFile.transferTo(save);
				} catch (Exception e) {
					e.printStackTrace();
				}
				builder.append(fileName);
				builder.append(",");
			}else continue;
		}
		builder.delete(builder.length()-1, builder.length());
		dto.setFileNames(builder.toString());
		dao.writeProc(dto);
	}
}
