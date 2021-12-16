package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.HostService;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class HostController {
	@Autowired private HostService hostService;
	
	// 사업자 신청 페이지
	@GetMapping("/member/requestHost")
	public String getUpdateNickname(HttpServletRequest request, Model model) {
    	System.out.println("HostController() 실행");
    	
    	Member loginMember = (Member) request.getSession().getAttribute("loginMember");
    	String memberId = loginMember.getMemberId();
    	
    	if(hostService.selectRequestingHost(memberId) >= 1) {
    		model.addAttribute("msg", "사업자 신청이 접수되기까지 기다려주세요.");
    	    model.addAttribute("url", "redirect:/index");
    	    return "/alert";
    	}
    	return "/member/requestHost";
    }
}
