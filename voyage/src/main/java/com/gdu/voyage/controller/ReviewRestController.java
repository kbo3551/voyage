package com.gdu.voyage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.AccomReviewService;
import com.gdu.voyage.service.ActivityReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ReviewRestController {
	@Autowired AccomReviewService accomReviewService;
	@Autowired ActivityReviewService activityReviewService;
	
	@GetMapping("/addAccomReviewCheck")
	public int addAccomReviewCheck(int accomPaymentNo) {
		return accomReviewService.selectReviewTotalCountOne(accomPaymentNo);
	}
	
	@GetMapping("/addActivityReviewCheck")
	public int addActivityReviewCheck(int activityPaymentNo) {
		return activityReviewService.selectReviewTotalCountOne(activityPaymentNo);
	}
}
