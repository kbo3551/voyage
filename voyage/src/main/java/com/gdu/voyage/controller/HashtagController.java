package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.HashtagService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HashtagController {
   @Autowired HashtagService hashtagService;
   
   @GetMapping("/hashtag")
   public String getHashtagList(Model model, @RequestParam(value = "hashtag", required = false) String hashtag) {
	  log.debug("[debug] HashtagController.getHashtagList 실행");
	  log.debug("[debug] HashtagController.getHashtagList hashtag : "+hashtag);
      
      Map<String, Object> map = hashtagService.getHashtagList(hashtag);
	  log.debug("[debug] map" + map);
      model.addAttribute("hashtagList", map.get("hashtagList"));
      
      return "/hashtag";
   }
   
//   @GetMapping("/hashtagResult")
//   public String hashtagResult(Model model, String hashtag) {
//	  log.debug("[debug] HashtagController().hashtagResult 실행");
//	  log.debug("[debug] HashtagController().hashtagResult hashtag : "+hashtag);
//      
//      Map<String, Object> map = hashtagService.getHashtagListByResult(hashtag);
//	  log.debug("[debug] map" + map);
//      model.addAttribute("hashtagList", map.get("hashtagList"));
//      return "hashtag";
//   }
}