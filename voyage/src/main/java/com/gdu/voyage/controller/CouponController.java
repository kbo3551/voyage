package com.gdu.voyage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.CouponService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class CouponController {
	 @Autowired CouponService couponService;
	 private final int ROW_PER_PAGE = 10;
	 @GetMapping("/admin/couponList")
	 public String getCouponList(Model model,@RequestParam(defaultValue = "1") int currentPage) {
		  System.out.println("CouponController()_coupon실행");
	      log.debug("★★★[boryeong]CouponController★★★"+currentPage);
	      
	      int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
	      
	      Map<String, Object> map = couponService.getCouponList(currentPage, ROW_PER_PAGE);
	      // 값
	      model.addAttribute("beginRow", beginRow);
	      model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
	      model.addAttribute("couponList", map.get("couponList"));
	      model.addAttribute("lastPage", map.get("lastPage"));
	      model.addAttribute("currentPage", currentPage);
	      int pageNo = ((beginRow / 100) * 10 + 1);
	      log.debug("★★★[boryeong]CouponController_pageNo★★★" + pageNo);
	      model.addAttribute("pageNo",pageNo);
	      
	      return "admin/couponList";
	 }
}
