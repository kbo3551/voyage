package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.HashtagService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HashtagController {
   @Autowired HashtagService hashtagService;
   
   @GetMapping("/hashtag")
   public String hashtag(Model model) {
	  log.debug("[debug] HashtagController().hashtag 실행");
      
      Map<String, Object> map = hashtagService.getHashtagList();
      model.addAttribute("hashtagList", map.get("hashtagList"));
      
      return "hashtag";
   }   
}