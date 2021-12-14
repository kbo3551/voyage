package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.HashtagService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@CrossOrigin
public class HashtagRestController {
   @Autowired HashtagService hashtagService;

   @GetMapping("/hashtagSearh")
   public List<Map<String, Object>> hashtagSearh(Model model, String searchKeyword) {
	  log.debug("HashtagRestController().hashtagSearh 실행");
      
	  List<Map<String, Object>> map = hashtagService.getHashtagListBySearch(searchKeyword);
	  log.debug("map" + map);
      
//      Map<String, Object> returnMap = new HashMap<>();
//      returnMap.put("hashtagList", map);
//      model.addAttribute("hashtagList", map.get("hashtagList"));
      
      return map;
   }
}