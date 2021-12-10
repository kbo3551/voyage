package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	@GetMapping("/addMember")
	   public String index() {
	      System.out.println("AddMemberController() 실행");
	      
	      return "addMember";
	   }
}	
