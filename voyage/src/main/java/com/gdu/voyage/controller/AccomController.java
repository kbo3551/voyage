package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.voyage.service.AccomBuildingService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class AccomController {
	@Autowired AccomBuildingService accomBuildingService;
	private Integer currentPage = 1;
	
	@GetMapping("addAccomBuilding")
	public String addAccomBuilding() {
		log.debug("AccomController 실행");
		return "/host/addAccomBuilding";
	}
	
	@PostMapping("addAccomBuilding")
	public String addAccomBuilding(AccomBuildingForm accomBuildingForm) {
		log.debug("AccomController 실행");
		
		// 참조타입 객체를 log.debug로 출력할 때는 toString()으로 출력함
		log.debug("★controller★ accomBuildingForm : " + accomBuildingForm.toString());
		accomBuildingService.addAccomBuilding(accomBuildingForm);
		return "redirect:/accomBuildingList";
	}
	
	@RequestMapping("/admin/accomBuildingList")
	public String getAccomBuildingList(Model model, int pageNo) {
		currentPage = pageNo;
		log.debug("accomBuildingList 실행!!");
		List<AccomBuilding> list = accomBuildingService.getAccomBuildingList(currentPage);
		model.addAttribute("list", list);
		return "/admin/accomBuildingList";
	}
	
	@GetMapping("/admin/accomBuildingList")
	public String accomBuildingList() {
		System.out.println("AccomBuildingController() 실행");
		
		return "/admin/accomBuildingList";
	}
	
}
