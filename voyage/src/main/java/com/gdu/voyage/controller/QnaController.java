package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
	@GetMapping("/qnaList") // Qna 게시판 리스트 
	public String QnaList() {
		System.out.println("QnaController() 실행");
	      
		return "/templates_citylisting/qnaList";
	}
}