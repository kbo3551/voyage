package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.HashtagService;

@Controller
public class HashtagController {
	@Autowired HashtagService hashtagService;
	
	@GetMapping("/hashtag")
	public String hashtag(Model model) {
		System.out.println("IndexController().hashtag 실행");
		
		Map<String, Object> map = hashtagService.getHashtagList();
		model.addAttribute("hashtagList", map.get("hashtagList"));
		
		return "hashtag";
	}
}
