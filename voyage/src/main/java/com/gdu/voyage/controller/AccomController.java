package com.gdu.voyage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.AccomBuildingService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingForm;
import com.gdu.voyage.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class AccomController {
	@Autowired
	AccomBuildingService accomBuildingService;
	private Integer currentPage = 1;

	// 사업자
	// 숙소_건물 등록
	@GetMapping("/host/addAccomBuilding")
	public String addAccomBuilding() {
		log.debug("AccomController 실행");
		return "/host/addAccomBuilding";
	}

	// 숙소_건물 등록
	@PostMapping("/host/addAccomBuilding")
	public String addAccomBuilding(AccomBuildingForm accomBuildingForm, HttpServletRequest request) {
		log.debug("AccomController 실행");

		// 참조타입 객체를 log.debug로 출력할 때는 toString()으로 출력함
		log.debug("★[지혜]controller★ accomBuildingForm : " + accomBuildingForm.toString());
		
		// 파일 저장 시, 절대경로를 알기 위해 HttpServletRequest를 사용해서 realPath를 잡아준 뒤 변수에 저장함
		String realPath = request.getServletContext().getRealPath("resources/image/accom_building//");
		
		// accomBuildingForm과 realPath를 매개변수로 하여 같이 service에 전달
		accomBuildingService.addAccomBuilding(accomBuildingForm, realPath);
		return "redirect:/accomBuildingList";
	}

	// 관리자
	// accomBuilding 목록 조회
	@RequestMapping("/admin/accomBuildingList")
	public String getAccomBuildingList(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		currentPage = pageNo;
		log.debug("accomBuildingList 실행!!");
		List<AccomBuilding> list = accomBuildingService.getAccomBuildingList(currentPage);
		model.addAttribute("list", list);
		return "/admin/accomBuildingList";
	}

	// accomBuilding 상세목록 조회
	@GetMapping("/admin/accomBuildingOne")
	public String getAccomBuildingOne(Model model, int accomBuildingNo) {
		System.out.println("accomBuildingOne 실행!!");
		List<AccomBuilding> accomBuilding = accomBuildingService.getAccomBuildingOne(accomBuildingNo);
		model.addAttribute("accomBuilding", accomBuilding);
		return "/admin/accomBuildingOne";
	}
	
	// accomBuilding state 승인여부 수정
	// 수정페이지 이동
	@GetMapping("/admin/accomBuildingUpdate")
	public String AccomBuildingUpdate() {
		System.out.println("accomBuildingUpdate 실행!!");
		return "/admin/accomBuildingUpdate";
	}
	
	// 페이지 수정
	@PostMapping("/admin/accomBuildingUpdate")
	public String AccomBuildingUpdate(AccomBuilding accomBuilding) {
		accomBuildingService.accomBuildingUpdate(accomBuilding);
		return "redirect:/admin/accomBuildingOne?accomBuildingNo=" +accomBuilding.getAccomBuildingNo();
	}
	
}
