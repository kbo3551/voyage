package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class AboutController {
	@GetMapping("/about") // about 출력
	public String getAccomProduct() {
		System.out.println("AboutController() 실행");
	      
		return "/templates_citylisting/about";
	}
}
