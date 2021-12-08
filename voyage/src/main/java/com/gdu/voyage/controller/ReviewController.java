package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	@GetMapping("/getReviewList")
	public String getReviewList() {
		System.out.println("ReviewController() 실행");
	      
		return "/templates_citylisting/getReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne() {
		System.out.println("ReviewController() 실행");
	      
		return "/templates_citylisting/getReviewOne";
	}
}
