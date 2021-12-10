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

@Controller
public class productManagementController {
   @GetMapping("/productManagement")
   public String management() {
      System.out.println("ProductManagement() 실행");
      
      return "templates_admin/productManagement";
   		}
	}
}