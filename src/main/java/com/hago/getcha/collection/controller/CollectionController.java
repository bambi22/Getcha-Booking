package com.hago.getcha.collection.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hago.getcha.collection.service.CollectionService;

@Controller
public class CollectionController {
	final static Logger logger = LoggerFactory.getLogger(CollectionController.class);
	@Autowired CollectionService service;
	
	@ResponseBody
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
		return "forward:index?formpath=myCollection";
	}
	
	@ResponseBody
	@RequestMapping(value = "delCollect")
	public Map<String, String> delCollect(@RequestBody Map<String,String> map) {
		String restNo = map.get("restNum");
		logger.warn("취소할 식당 번호: " + restNo);
		int result = service.delCollect(restNo);
		if(result == 1)
			map.put("result", "success");
		else 
			map.put("result", "fail");
		return map;
	}
}
