package com.hago.getcha.review.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.review.dao.IReviewDAO;
import com.hago.getcha.review.dto.AllDTO;
import com.hago.getcha.review.dto.ReviewDTO;

@Service
public class ReviewService {
	final static Logger logger = LoggerFactory.getLogger(ReviewService.class);
	@Autowired HttpSession session;
	@Autowired IReviewDAO dao;
	static String FILE_LOCATION = "/upload/";
	private String deleteFile ="";
	
	public void writeProc(MultipartHttpServletRequest req) {
		//String email = (String) session.getAttribute("email");
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
		logger.warn("content : " + content);
		logger.warn("restNum : " + restNum);
		logger.warn("point : " + point);
		
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
				String realPath = req.getServletContext().getRealPath(FILE_LOCATION);
				File folder = new File(realPath);
				if(!folder.isDirectory()) {
					folder.mkdir();
				}
				File save = new File(realPath + fileName);
				System.out.println(save);
				try {
					mFile.transferTo(save);
				} catch (Exception e) {
					e.printStackTrace();
				}
				builder.append(fileName);
				builder.append(",");
			}else continue;
		}
		if(builder.length() != 0) {
			builder.delete(builder.length()-1, builder.length());
			dto.setFileNames(builder.toString());
		}else {
			dto.setFileNames("파일없음");
		}
		dao.writeProc(dto);
	}
	
	public void reviewProc(Model model) {
		//String email = (String) session.getAttribute("email");
		String email = "test21@hago.com";
		ArrayList<AllDTO> reviewList = dao.reviewProc(email);
		model.addAttribute("reviewList", reviewList);
	}

	public int deleteProc(String delNum,String fileNames,HttpServletRequest req) {
		int reviewNum = Integer.parseInt(delNum);
		String[] fileName = fileNames.split(",");
		int len = fileName.length;
		for(int i = 0; i <= len-1; i++) {
			deleteFile = fileName[i];
			delete(deleteFile, req);
		}
		return dao.deleteProc(reviewNum);
	}
	
	public static boolean delete(String deleteFile, HttpServletRequest req) {
		String savePath = getRealPath(FILE_LOCATION + deleteFile, req);
		logger.warn("삭제된 파일: " + savePath);
		return getFile(savePath).delete();
	}
	
	public static File getFile(String fileName) {
		return new File(fileName);
	}
	
	public static String getRealPath(String path, HttpServletRequest req) {
		return req.getServletContext().getRealPath(path);
	}
	
}
