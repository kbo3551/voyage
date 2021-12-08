package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
   @GetMapping("/adminIndex")
   public String index() {
      System.out.println("AdminController() 실행");
      
      return "templates_admin/adminIndex";
   }
}