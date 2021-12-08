package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	@GetMapping("/getAccomProduct")
	public String getReviewList() {
		System.out.println("ProductController() 실행");
	      
		return "/templates_citylisting/getAccomProduct";
	}
	
	@GetMapping("/getActivityProduct")
	public String getReviewOne() {
		System.out.println("ProductController() 실행");
	      
		return "/templates_citylisting/getActivityProduct";
	}
}
