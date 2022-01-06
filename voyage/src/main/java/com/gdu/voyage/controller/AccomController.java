package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.AccomBuildingService;
import com.gdu.voyage.service.AccomRoomService;
import com.gdu.voyage.service.HostService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingForm;
import com.gdu.voyage.vo.AccomRoomForm;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class AccomController {
	private final int ROW_PER_PAGE = 10;
	@Autowired
	AccomBuildingService accomBuildingService;
	@Autowired
	AccomRoomService accomRoomService;
	@Autowired
	HostService hostService;

	// 사업자
	// 숙소_건물 등록
	@GetMapping("/host/addAccomBuilding")
	public String addAccomBuilding() {
		log.debug("AccomController 실행");
		return "/host/addAccomBuilding";
	}

	// 숙소_건물 등록
	@PostMapping("/host/addAccomBuilding")
	public String addAccomBuilding(AccomBuildingForm accomBuildingForm, HttpServletRequest request, HttpSession session) {
		log.debug("AccomController 실행");
		
		// 로그인한 호스트의 memberId를 알기 위해 세션을 가져옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		log.debug("★[지혜]controller★ memberId : " + memberId);
		
		//가져온 memberId로 작성자의 host_no를 조회함
		int hostNo = hostService.selectHostNo(memberId);
		log.debug("★[지혜]controller★ hostNo : " + hostNo);

		// 참조타입 객체를 log.debug로 출력할 때는 toString()으로 출력함
		log.debug("★[지혜]controller★ accomBuildingForm : " + accomBuildingForm.toString());
		
		// 파일 저장 시, 절대경로를 알기 위해 HttpServletRequest를 사용해서 realPath를 잡아준 뒤 변수에 저장함
		String realPath = request.getServletContext().getRealPath("resources/image/accom_building//");
		
		// accomBuildingForm과 realPath를 매개변수로 하여 같이 service에 전달
		accomBuildingService.addAccomBuilding(accomBuildingForm, realPath, hostNo);
		return "redirect:/host/addAccomRoom?accomBuildingNo="+accomBuildingForm.getAccomBuilding().getAccomBuildingNo();
	}
	
	// 숙소_객실 등록
	@GetMapping("/host/addAccomRoom")
	public String addAccomRoom(Model model, @RequestParam int accomBuildingNo) {
		log.debug("AccomController 실행");
		log.debug("★[지혜]controller★ accomBuildingNo : " + accomBuildingNo);
		
		model.addAttribute("accomBuildingNo", accomBuildingNo);
		
		return "/host/addAccomRoom";
	}

	// 숙소_객실 등록
	@PostMapping("/host/addAccomRoom")
	public String addAccomRoom(AccomRoomForm accomRoomForm, HttpServletRequest request, HttpSession session) {
		log.debug("AccomController 실행");
		
		// 로그인한 호스트의 memberId를 알기 위해 세션을 가져옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		log.debug("★[지혜]controller★ memberId : " + memberId);
		
		//가져온 memberId로 작성자의 host_no를 조회함
		int hostNo = hostService.selectHostNo(memberId);
		log.debug("★[지혜]controller★ hostNo : " + hostNo);

		// 참조타입 객체를 log.debug로 출력할 때는 toString()으로 출력함
		log.debug("★[지혜]controller★ accomRoomForm : " + accomRoomForm.toString());
		
		// 파일 저장 시, 절대경로를 알기 위해 HttpServletRequest를 사용해서 realPath를 잡아준 뒤 변수에 저장함
		String realPath = request.getServletContext().getRealPath("resources/image/accom_room//");
		
		// accomRoomForm과 realPath를 매개변수로 하여 같이 service에 전달
		accomRoomService.addAccomRoom(accomRoomForm, realPath, hostNo);
		return "redirect:/host/accomBuildingOne?accomBuildingNo="+accomRoomForm.getAccomRoom().getAccomBuildingNo();
	}
	

	// 관리자
	// accomBuilding 목록 조회
	@GetMapping("/admin/accomBuildingList")
	public String getAccomBuildingList(Model model, @RequestParam(defaultValue = "1") int currentPage) {
	
		log.debug("accomBuildingList 실행!!");
		log.debug("**********[상훈]AccomController"+currentPage);
		
		int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		
		Map<String, Object> map = accomBuildingService.getAccomBuildingList(currentPage, ROW_PER_PAGE);
		// 값
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("accomBuildingList", map.get("accomBuildingList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug("**********[상훈]AccomController_pageNo" + pageNo);
		model.addAttribute("pageNo", pageNo);
		
		return "admin/accomBuildingList";
	}

	// accomBuilding 상세목록 조회
	@GetMapping("/admin/accomBuildingOne")
	public String getAccomBuildingOne(Model model, int accomBuildingNo) {
		System.out.println("accomBuildingOne 실행!!");
		AccomBuilding accomBuilding = accomBuildingService.getAccomBuildingOne(accomBuildingNo);
		model.addAttribute("accomBuilding", accomBuilding);
		return "/admin/accomBuildingOne";
	}
	
	// accomBuilding state 승인여부 수정
	// 수정페이지 이동
	@GetMapping("/admin/accomBuildingUpdate")
	public String accomBuildingUpdate(Model model, int accomBuildingNo) {
		System.out.println("accomBuildingUpdate 실행!!");
		AccomBuilding accomBuilding = accomBuildingService.getAccomBuildingOne(accomBuildingNo);
		model.addAttribute("accomBuilding", accomBuilding);
		return "/admin/accomBuildingUpdate";
	}
	
	// 페이지 수정
	@PostMapping("/admin/accomBuildingUpdate")
	public String accomBuildingUpdate(AccomBuilding accomBuilding) {
		accomBuildingService.accomBuildingUpdate(accomBuilding);
		return "redirect:/admin/accomBuildingOne?accomBuildingNo=" +accomBuilding.getAccomBuildingNo();
	}
	
	// 승인완료된 accomBuilding 상세목록 조회
		@GetMapping("/admin/accessAccomBuilding")
		public String getAccessAccomBuilding(Model model) {
			System.out.println("accessAccomBuilding 실행!!");
			List<AccomBuilding> list = accomBuildingService.selectAccessAccomBuilding();
			model.addAttribute("list", list);
			return "/admin/accessAccomBuilding";
		}
		
}
