package com.hago.getcha.review.controller;

import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "writeProc")
	public String writeProc(MultipartHttpServletRequest req) {
		String fileName="";
		
		Iterator<String> files = req.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			
			MultipartFile mFile = req.getFile(uploadFile);
			fileName = mFile.getOriginalFilename();
			System.out.println("실제 파일 이름: " + fileName);
		}
		return "";
	}
}
