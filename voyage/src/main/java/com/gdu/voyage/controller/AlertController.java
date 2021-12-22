package com.gdu.voyage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class AlertController {
	
	@RequestMapping("/alert")
	public String postAlert(String url) {
    	log.trace("AlertController() 실행");
    	return url;
    }
}
