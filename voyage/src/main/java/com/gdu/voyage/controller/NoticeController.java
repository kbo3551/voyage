package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@GetMapping("/noticeList") // 공지사항 게시판 리스트
	public String getAccomProduct() {
		System.out.println("NoticeController() 실행");
	      
		return "/templates_citylisting/noticeList";
	}
}