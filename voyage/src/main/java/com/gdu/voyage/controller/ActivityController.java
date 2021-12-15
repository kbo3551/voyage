package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ActivityService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityForm;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@Transactional
public class ActivityController {
	@Autowired ActivityService activityService;
	private Integer currentPage = 1;
	
	// activity 목록 조회
	@RequestMapping("/admin/activityList")
	public String getActivityList(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		currentPage = pageNo;
		log.debug("activityList 실행!!");
		List<Activity> list = activityService.getActivityList(currentPage);
		model.addAttribute("list", list);
		return "/admin/activityList";
	}
	// accomBuilding 상세목록 조회
		@GetMapping("/admin/activityOne")
		public String getActivityOne(Model model, int activityNo) {
			System.out.println("accomBuildingOne 실행!!");
			List<Activity> activity = activityService.getActivityOne(activityNo);
			model.addAttribute("activity", activity);
			return "/admin/activityOne";
		}
	
	@GetMapping("/host/addActivity")
	public String addActivity() {
		log.debug("ActivityController 실행");
		return "/host/addActivity";
	}

	@PostMapping("/host/addActivity")
	public String addActivity(ActivityForm activityForm) {
		log.debug("ActivityController 실행");

		// 참조타입 객체를 log.debug로 출력할 때는 toString()으로 출력함
		log.debug("★[지혜]controller★ activityForm : " + activityForm.toString());
		activityService.addActivity(activityForm);
		return "redirect:/activityList";
	}
}
