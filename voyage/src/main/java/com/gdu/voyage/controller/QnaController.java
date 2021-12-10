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
	@GetMapping("/getQnaOne") // Qna 상세 내용
	public String getQnaOne() {
		System.out.println("getQnaOneController() 실행");
	      
		return "/templates_citylisting/getQnaOne";
	}
	@GetMapping("/addQ")
	public String addQ() {
		System.out.println("addQuestionController() 실행");
		
		return "/templates_citylisting/addQ";
	}
}