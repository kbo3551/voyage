package com.gdu.voyage.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.voyage.service.HostService;
import com.gdu.voyage.vo.HostAsk;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class HostController {
	@Autowired private HostService hostService;
	
	// 사업자 신청 페이지 get
	@GetMapping("/member/requestHost")
	public String getRequestHost(HttpServletRequest request, Model model) {
    	System.out.println("HostController() 실행");
    	
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
    	System.out.println("HostController() 실행");
    	
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
