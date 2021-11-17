package com.hago.getcha.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hago.getcha.review.service.ReviewService;

@Controller
public class ReviewController {
	
	final static Logger logger = LoggerFactory.getLogger(ReviewController.class);
	@Autowired ReviewService service;
	
	@RequestMapping(value = "writeProc")
	public String writeProc(MultipartHttpServletRequest req) {
		service.writeProc(req);
		return "forward:write";
	}
	
	@RequestMapping(value = "reviewProc")
	public String reviewProc(Model model) {
		//service.reviewProc(model);
		return "forward:index?formpath=review";
	}
}
