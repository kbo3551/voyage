package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	@GetMapping("/login")
	   public String index() {
	      System.out.println("LoginController() 실행");
	      
	      return "login";
	   }
}	
