package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.HashtagService;

@RestController
@CrossOrigin
public class HashtagRestController {
   @Autowired HashtagService hashtagService;

   @GetMapping("/hashtagSearh")
   public String hashtagSearh(Model model, String searchKeyword) {
      System.out.println("HashtagRestController().hashtagSearh 실행");
      
      Map<String, Object> map = hashtagService.getHashtagListBySearch(searchKeyword);
      model.addAttribute("hashtagList", map.get("hashtagList"));
      
      return "hashtag";
   }
}