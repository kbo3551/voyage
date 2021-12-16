package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class HostController {
	
	// 사업자 신청 페이지
	@GetMapping("/member/requestHost")
	public String getUpdateNickname() {
    	System.out.println("HostController() 실행");
    	return "/member/requestHost";
    }
}
