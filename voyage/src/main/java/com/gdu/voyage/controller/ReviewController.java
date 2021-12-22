package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@GetMapping("/getActivityReviewList")
	public String getActivityReviewList() {
		System.out.println("ActivityReviewController() 실행");
	      
		return "/templates_citylisting/getActivityReviewList";
	}
	
	@GetMapping("/setReviewCategory")
	public String setProductCategory() {
		System.out.println("ActivityReviewController() 실행");	      
		return "/product/setReviewCategory";
	}
	
	@GetMapping("/getAccomReviewList")
	public String getAccomReviewList() {
		System.out.println("AccomReviewController() 실행");
	      
		return "/templates_citylisting/getAccomReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne() {
		System.out.println("ReviewController() 실행");
	      
		return "/templates_citylisting/getReviewOne";
	}

}
