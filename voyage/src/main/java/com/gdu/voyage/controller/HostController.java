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
import com.gdu.voyage.vo.AccomBuilding;
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
	
	
	// 신청 대기중인 체험 목록
	@GetMapping("/host/activityReqState")
	public String getActivityReqState(HttpServletRequest request,Model model,HttpSession session) {
		log.trace("HostController() 실행");
		
		// host세션
    	Host hostSession = (Host)session.getAttribute("hostSession");
    	
    	// hostNo 추출
    	int hostNo = hostSession.getHostNo();
    	
    	// 신청 대기중인 숙소 리스트
    	List<Activity> activityReqState = activityService.selectReqActivityListByHost(hostNo);
    	
    	// 신청 대기중인 목록 갯수
    	int activityReqCount = activityService.selectReqActivityCountByHost(hostNo);
    	
    	model.addAttribute("activityReqState", activityReqState);
    	model.addAttribute("activityReqCount", activityReqCount);
    	
    	return "/host/activityReqState";
	}
	
	// 신청 대기중인 숙소 목록
	@GetMapping("/host/accomReqState")
	public String getAccomReqState(HttpServletRequest request,Model model,HttpSession session) {
		log.trace("HostController() 실행");
		
		// host세션
    	Host hostSession = (Host)session.getAttribute("hostSession");
    	
    	// hostNo 추출
    	int hostNo = hostSession.getHostNo();
    	
    	// 신청 대기중인 숙소 리스트
    	List<AccomBuilding> accomReqState = accomBuildingService.selectReqAccomBuildingListByHost(hostNo);
    	
    	// 신청 대기중인 목록 갯수
    	int accomReqCount = accomBuildingService.selectReqAccomBuildingCountByHost(hostNo);
    	
    	model.addAttribute("accomReqState", accomReqState);
    	model.addAttribute("accomReqCount", accomReqCount);
    	
    	return "/host/accomReqState";
	}
	
	// 사업자 myPage
	@GetMapping("/host/hostIndex")
	public String getHostIndex(HttpServletRequest request,Model model,HttpSession session, @RequestParam(defaultValue = "1") int accomPage) {
    	log.trace("HostController() 실행");
    	
    	// host세션
    	Host hostSession = (Host)session.getAttribute("hostSession");
    	
    	// hostNo 추출
    	int hostNo = hostSession.getHostNo();
    	
    	// 숙소 페이징
    	int accomBeginRow = (accomPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int accomPageNo = ((accomBeginRow / 100) * 10 + 1);
    	
    	// hostNo에 따른 숙소목록 받아옴
    	Map<String, Object> accomMap = accomBuildingService.selectAccomBuildingListByHost(accomPage, ROW_PER_PAGE,hostNo);
    	
    	

    	
    	// 체험 목록 받아옴. 정렬은 쿼리문 내에서.
    	List<Activity> ActivityList = activityService.selectActivityListByHost(hostNo);
    	
    	// 숙소, 체험 신청목록이 있나 확인
    	int accomReqCount = accomBuildingService.selectReqAccomBuildingCountByHost(hostNo);
    	int activityReqCount = activityService.selectReqActivityCountByHost(hostNo);
    	
    	
    	
    	model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
    	
    	model.addAttribute("accomBeginRow", accomBeginRow);
		model.addAttribute("accomBuildingList", accomMap.get("accomBuildingList"));
		model.addAttribute("accomLastPage", accomMap.get("lastPage"));
		model.addAttribute("accomCount", accomMap.get("totalCount"));
		model.addAttribute("accomPage", accomPage);
		model.addAttribute("accomPageNo", accomPageNo);
    	
    	model.addAttribute("ActivityList", ActivityList);
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
}
