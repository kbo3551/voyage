package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

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
import com.gdu.voyage.service.ActivityService;
import com.gdu.voyage.service.HostService;
import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.HostAsk;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class HostController {
	
	private final int ROW_PER_PAGE = 10;
	
	@Autowired private HostService hostService;
	@Autowired private AccomBuildingService accomBuildingService;
	@Autowired private ActivityService activityService;
	@Autowired private ProductService productService;
	
	// 신청 대기중인 체험 목록
	@GetMapping("/host/activityReqState")
	public String getActivityReqState(HttpServletRequest request,Model model,HttpSession session, @RequestParam(defaultValue = "1") int page) {
		log.trace("HostController() 실행");
		
		// host세션
    	Host hostSession = (Host)session.getAttribute("hostSession");
    	
    	// hostNo 추출
    	int hostNo = hostSession.getHostNo();
    	
    	// 페이징
    	int beginRow = (page * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int pageNo = ((beginRow / 100) * 10 + 1);
    	
    	// 신청 대기중인 숙소 맵으로 받아옴
    	Map<String, Object> reqMap = activityService.selectReqActivityListByHost(page, ROW_PER_PAGE, hostNo);
    	
    	model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
    	model.addAttribute("beginRow", beginRow);
		model.addAttribute("activityReqList", reqMap.get("activityReqList"));
		model.addAttribute("lastPage", reqMap.get("lastPage"));
		model.addAttribute("totalCount", reqMap.get("totalCount"));
		model.addAttribute("page", page);
		model.addAttribute("pageNo", pageNo);
    	
    	return "/host/activityReqState";
	}
	
	// 신청 대기중인 숙소 목록
	@GetMapping("/host/accomReqState")
	public String getAccomReqState(HttpServletRequest request,Model model,HttpSession session, @RequestParam(defaultValue = "1") int page) {
		log.trace("HostController() 실행");
		
		// host세션
    	Host hostSession = (Host)session.getAttribute("hostSession");
    	
    	// hostNo 추출
    	int hostNo = hostSession.getHostNo();
    	
    	// 페이징
    	int beginRow = (page * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int pageNo = ((beginRow / 100) * 10 + 1);
    	
    	// 신청 대기중인 숙소 맵으로 받아옴
    	Map<String, Object> reqMap = accomBuildingService.selectReqAccomBuildingListByHost(page, ROW_PER_PAGE,hostNo);
    	
    	model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
    	model.addAttribute("beginRow", beginRow);
		model.addAttribute("accomBuildingReqList", reqMap.get("accomBuildingReqList"));
		model.addAttribute("lastPage", reqMap.get("lastPage"));
		model.addAttribute("totalCount", reqMap.get("totalCount"));
		model.addAttribute("page", page);
		model.addAttribute("pageNo", pageNo);
    	
    	return "/host/accomReqState";
	}
	
	// 사업자 myPage
	@GetMapping("/host/hostIndex")
	public String getHostIndex(HttpServletRequest request,Model model,HttpSession session,
		   @RequestParam(defaultValue = "1") int accomPage, @RequestParam(defaultValue = "1") int activityPage) {
    	log.trace("HostController() 실행");
    	
    	// host세션
    	Host hostSession = (Host)session.getAttribute("hostSession");
    	
    	// hostNo 추출
    	int hostNo = hostSession.getHostNo();
    	
    	// 숙소 페이징
    	int accomBeginRow = (accomPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int accomPageNo = ((accomBeginRow / 100) * 10 + 1);
    	
    	// 체험 페이징
    	int activityBeginRow = (activityPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int activityPageNo = ((activityBeginRow / 100) * 10 + 1);
    	
    	// hostNo에 따른 숙소, 체험 목록+페이징
    	Map<String, Object> accomMap = accomBuildingService.selectAccomBuildingListByHost(accomPage, ROW_PER_PAGE,hostNo);
    	Map<String, Object> activityMap = activityService.selectActivityListByHost(activityPage, ROW_PER_PAGE,hostNo);
    	
    	// 숙소, 체험 신청목록이 있나 확인
    	int accomReqCount = accomBuildingService.selectReqAccomBuildingCountByHost(hostNo);
    	int activityReqCount = activityService.selectReqActivityCountByHost(hostNo);
    	
    	
    	
    	model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
    	
    	// 숙소
    	model.addAttribute("accomBeginRow", accomBeginRow);
		model.addAttribute("accomBuildingList", accomMap.get("accomBuildingList"));
		model.addAttribute("accomLastPage", accomMap.get("lastPage"));
		model.addAttribute("accomCount", accomMap.get("totalCount"));
		model.addAttribute("accomPage", accomPage);
		model.addAttribute("accomPageNo", accomPageNo);
    	
		// 체험
		model.addAttribute("activityBeginRow", activityBeginRow);
		model.addAttribute("activityList", activityMap.get("activityList"));
		model.addAttribute("activityLastPage", activityMap.get("lastPage"));
		model.addAttribute("activityCount", activityMap.get("totalCount"));
		model.addAttribute("activityPage", activityPage);
		model.addAttribute("activityPageNo", activityPageNo);
		
		// 신청
    	model.addAttribute("accomReqCount", accomReqCount);
    	model.addAttribute("activityReqCount", activityReqCount);

    	return "/host/hostIndex";
    }
	
	// 사업자 신청 페이지 get
	@GetMapping("/member/requestHost")
	public String getRequestHost(HttpServletRequest request, Model model) {
    	log.trace("HostController() 실행");
    	
    	Member loginMember = (Member) request.getSession().getAttribute("loginMember");
    	String memberId = loginMember.getMemberId();
    	log.trace("★controller★ : "+memberId);
    	
    	if(hostService.selectRequestingHost(memberId) >= 1) {
    		model.addAttribute("msg", "사업자 신청이 접수되기까지 기다려주세요.");
    	    model.addAttribute("url", "redirect:/index");
    	    return "/alert";
    	}
    	return "/member/requestHost";
    }
	
	// 사업자 신청 페이지 post
	@PostMapping("/member/requestHost")
	public String postRequestHost(HttpServletRequest request, Model model) {
    	log.trace("HostController() 실행");
    	
    	Member loginMember = (Member) request.getSession().getAttribute("loginMember");
    	String memberId = loginMember.getMemberId();
    	log.trace("★controller★ : "+memberId);
    	
    	// 랜덤 사업자번호 생성
    	Random rd = new Random();
    	int number1 = rd.nextInt(900) + 101;
    	int number2 = rd.nextInt(90) + 11;
    	int number3 = rd.nextInt(90000) + 10001;
    	String hostReg = number1+"-"+number2+"-"+number3;
    	
    	// 객체 생성
    	HostAsk hostAsk = new HostAsk();
    	hostAsk.setMemberId(memberId);
    	hostAsk.setHostReg(hostReg);
    	
    	// 추가
    	hostService.insertRequestHost(hostAsk);
    	model.addAttribute("msg", "사업자 신청이 완료되었습니다.\n승인까지 시간이 걸릴 수 있습니다.");
	    model.addAttribute("url", "redirect:/index");
	    return "/alert";
    }
	
	// 사업자 체험 상세보기
	@GetMapping("/host/activityOne")
	public String getHostActivityOne(Model model, int activityNo) {
		log.debug("[debug] ProductController.getActivityOne 실행");
		log.debug("[debug] ProductController.getActivityOne activityNo : " + activityNo);
		
		int currentPage = 0;
		
		// [사업자] 체험 상세 조회
		Activity activityOne = productService.getActivityOne(activityNo);
		model.addAttribute("activityOne", activityOne);
		log.debug("[debug] ProductController.getActivityOne activityOne : " + activityOne);
		
		// [사업자] 체험 상세-목록 조회
		List<Activity> activityOneList = productService.getActivityList(currentPage, ROW_PER_PAGE);
		model.addAttribute("activityOneList", activityOneList);
		log.debug("[debug] ProductController.getActivityOne activityOneList : " + activityOneList);
		
		return "/host/activityOne";
	}
	
	// 사업자 숙소 건물 상세보기
	   @GetMapping("/host/accomBuildingOne")
	   public String getAccomBuildingOne(Model model, int accomBuildingNo) {
	      log.debug("[debug] ProductController.getAccomBuildingOne 실행");
	      log.debug("[debug] ProductController.getAccomBuildingOne accomBuildingNo : " + accomBuildingNo);
	      
	      int currentPage = 0;
	      
	      // [사업자] 숙소-건물 상세 조회
	      AccomBuilding accomBuildingOne = productService.getAccombuildingOne(accomBuildingNo);
	      model.addAttribute("accomBuildingOne", accomBuildingOne);
	      log.debug("[debug] ProductController.getAccomBuildingOne accomBuildingOne : " + accomBuildingOne);
	      
	      // [사업자] 숙소-건물-객실 목록 조회
	      List<AccomRoom> accomRoom = productService.getAccomRoomList(accomBuildingNo, currentPage, ROW_PER_PAGE);
	      model.addAttribute("accomRoom", accomRoom);
	      log.debug("[debug] ProductController.getAccomBuildingOne accomRoom : " + accomRoom);

	      // [사업자] 숙소-건물 상세-목록 조회
	      Map<String, Object> accomMap = (Map<String, Object>) productService.getAccomBuildingList(currentPage, ROW_PER_PAGE,null);
	      model.addAttribute("accomBuildingOneList", accomMap.get("accomBuildingList"));
	      log.debug("[debug] ProductController.getAccomBuildingOne accomMap : " + accomMap);
	      
	      return "/host/accomBuildingOne";
	   }
	   
	   // 사업자 숙소 객실 상세보기
	   @GetMapping("/host/accomRoomOne")
	   public String getAccomRoomOne(Model model, int accomBuildingNo, int accomRoomNo) {
	      log.debug("[debug] ProductController.getAccomRoomOne 실행");
	      log.debug("[debug] ProductController.getAccomRoomOne accomRoomNo : " + accomRoomNo);
	      
	      int currentPage = 0;
	      
	      // [사업자] 숙소-건물-객실 상세 조회
	      AccomRoom accomRoomOne = productService.getAccomRoomOne(accomRoomNo);
	      model.addAttribute("accomRoomOne", accomRoomOne);
	      log.debug("[debug] ProductController.getAccomRoomOne accomRoomOne : " + accomRoomOne);

	      // [사업자] 숙소-건물-객실 상세-목록 조회
	      List<AccomRoom> accomRoomOneList = productService.getAccomRoomList(accomBuildingNo, currentPage, ROW_PER_PAGE);
	      model.addAttribute("accomRoomOneList", accomRoomOneList);
	      log.debug("[debug] ProductController.getAccomBuildingOne accomRoomOneList : " + accomRoomOneList);
	      
	      return "/host/accomRoomOne";
	   }
	}