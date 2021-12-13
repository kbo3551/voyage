package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ActivityService;
import com.gdu.voyage.vo.Activity;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@Transactional
public class ActivityController {
	@Autowired ActivityService activityService;
	private Integer currentPage = 1;
	
	@RequestMapping("/admin/activityList")
	public String getActivityList(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		currentPage = pageNo;
		log.debug("activityList 실행!!");
		List<Activity> list = activityService.getActivityList(currentPage);
		model.addAttribute("list", list);
		return "/admin/activityList";
	}
}
