package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	private Integer currentPage = 1;
	private final int ROW_PER_PAGE = 10;
	
	@GetMapping("/getActivityReviewList")
	public String getActivityReviewList() {
		System.out.println("ActivityReviewController() 실행");
	      
		return "/templates_citylisting/getActivityReviewList";
	}
	
	@GetMapping("/setReviewCategory")
	public String setProductCategory() {
		System.out.println("ActivityReviewController() 실행");	      
		return "/product/setReviewCategory";
	}
	
	// [Member] 숙소 후기 목록 조회
	@GetMapping("/getAccomReviewList")
	public String getAccomReviewList(Model model, @RequestParam(defaultValue="1") int currentPage, @RequestParam @Nullable String Review) {
		log.debug("ReviewController() 실행");
		Map<String, Object> map = reviewService.getAccomReviewList(Review, currentPage, ROW_PER_PAGE);
		int[] navArray = reviewService.countPage(currentPage);

		model.addAttribute("accomReviewList", map.get("accomReviewList"));
		model.addAttribute("navArray", navArray);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", map.get("currentPage"));
		model.addAttribute("totalCount", map.get("totalCount"));
		
		return "/templates_citylisting/getAccomReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne() {
		System.out.println("ReviewController() 실행");
	      
		return "/templates_citylisting/getReviewOne";
	}

}
