package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.voyage.service.QnaService;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired QnaService qnaService;
	// Qna 게시판 리스트
	@GetMapping("/qnaList")  
	public String QnaList() {
		System.out.println("QnaController() 실행");
	      
		return "/templates_citylisting/qnaList";
	}
	// Qna 상세 내용
	@GetMapping("/getQnaOne") 
	public String getQnaOne() {
		System.out.println("getQnaOneController() 실행");
	      
		return "/templates_citylisting/getQnaOne";
	}
	// 질문 작성 get
	@GetMapping("/addQ")
	public String addQ() {
		System.out.println("addQuestionController() 실행");
		return "/templates_citylisting/addQ";
	}
	// 질문 작성 post
	@PostMapping("/addQ")
	public String addQ(QnaForm qnaForm) {
		log.debug(qnaForm.toString());
		qnaService.addQ(qnaForm);
		return "redirect:/qnaList";
	}
	
}