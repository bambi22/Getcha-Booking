package com.hago.getcha.collection.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hago.getcha.collection.service.CollectionService;
@RestController
public class CollectionController {
	final static Logger logger = LoggerFactory.getLogger(CollectionController.class);
	@Autowired CollectionService service;
	
	@RequestMapping(value = "collectProc")
	public Map<String, String> collectProc(HttpServletRequest req) {
		String reviewNum = req.getParameter("reviewNum");
		int result = service.colletProc(reviewNum);
		Map<String, String> data = new HashMap<>();
		if(result == 1) 
			data.put("result", "success");
		else
			data.put("result", "fail");
		return data;
	}
	
	@RequestMapping(value = "myCollectProc")
	public String myCollectProc(Model model) {
		service.myCollectProc(model);
		return "forward: collectionForm";
	}

}
