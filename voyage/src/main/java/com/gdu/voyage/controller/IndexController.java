package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
   @GetMapping("/map")
   public String index() {
      System.out.println("IndexController() 실행");
      
      return "/templates/map";
   }
}