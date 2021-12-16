package com.gdu.voyage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired ProductService productService;
	
	@GetMapping("/getAccomProductList")
	public String getAccomProduct() {
		System.out.println("ProductController() 실행");
	    
		return "/getAccomProductList";
	}
	
	@GetMapping("/getActivityProductList")
	public String getActivityProduct() {
		System.out.println("ProductController() 실행");
	    
		return "/getActivityProductList";
	}
	
	@GetMapping("/setProductCategory")
	public String setReviewCategory() {
		System.out.println("ActivityReviewController() 실행");
	      
		return "/setProductCategory";
	}
	
}
