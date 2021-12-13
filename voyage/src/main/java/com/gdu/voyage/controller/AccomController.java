package com.gdu.voyage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.voyage.service.AccomBuildingService;
import com.gdu.voyage.vo.AccomBuildingForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccomController {
	@Autowired AccomBuildingService accomBuildingService;
	
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
}
