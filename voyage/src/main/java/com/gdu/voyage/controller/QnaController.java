package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.voyage.service.QnaService;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired QnaService qnaService;
	private Integer currentPage = 1;
	
	@RequestMapping("/qnaList")
	public String getQnaList(Model model, int pageNo) {
		currentPage = pageNo;
		log.debug(currentPage + "currentPage");
		List<Qna> list = qnaService.getQnaList(currentPage);
		int[] arrayList = qnaService.countPage(currentPage);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", currentPage);
		model.addAttribute("arrayList", arrayList);
		return "/templates_citylisting/qnaList";
	}
	// Qna 게시판 리스트
	@GetMapping("/qnaList")  
	public String QnaList() {
		System.out.println("QnaController() 실행");
	      
		return "/templates_citylisting/qnaList";
	}
	// Qna 상세 내용
	@GetMapping("/getQnaOne") 
	public String getQnaOne(Model model, int qnaNo) {
		System.out.println("getQnaOneController() 실행");
	    Qna qna = qnaService.getQnaOne(qnaNo);
	    model.addAttribute("qna", qna);
	    model.addAttribute("currentPage", currentPage);
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
	public String addQ(QnaForm qnaForm) throws Exception {
		log.debug(qnaForm.toString());
		qnaService.addQ(qnaForm);
		return "redirect:/qnaList?pageNo=1";
	}
}