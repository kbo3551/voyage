package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
   @GetMapping("/index")
   public String index() {
	   System.out.println("IndexController().index 실행");
      
	   return "index";
   }
   
   @GetMapping("/getProductAll")
	public String product() {
		System.out.println("IndexController().product 실행");
		
		return "/templates_citylisting/getProductAll";
	}
   
   @GetMapping("/getReviewAll")
	public String review() {
		System.out.println("IndexController().review 실행");
		
		return "/templates_citylisting/getReviewAll";
	}
   
}