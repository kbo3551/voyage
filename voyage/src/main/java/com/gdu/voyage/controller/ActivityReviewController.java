package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ActivityReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActivityReviewController {
	@Autowired ActivityReviewService activityReviewService;
	private final int ROW_PER_PAGE = 6;
	
	// [Member] 숙소 후기 목록 조회
		@GetMapping("/getActivityReviewList")
		public String getActivityReviewList(Model model, @RequestParam(defaultValue="1") int currentPage, @RequestParam @Nullable String Review) {
			log.debug("ReviewController() 실행");
			Map<String, Object> map = activityReviewService.getActivityReviewList(Review, currentPage, ROW_PER_PAGE);
			int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
			int pageNo = ((controllPage / 100) * 10 + 1);

			model.addAttribute("controllPage", controllPage);
			model.addAttribute("activityReviewList", map.get("activityReviewList"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageNo", pageNo);
			
			return "/templates_citylisting/getActivityReviewList";
		}
}
