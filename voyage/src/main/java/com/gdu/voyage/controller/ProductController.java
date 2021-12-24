package com.gdu.voyage.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.Activity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired ProductService productService;
	
	private final int ROW_PER_PAGE = 6;
	
	@GetMapping("/getAccomProductList")
	public String getAccomBuildingProduct(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		log.debug("[debug] ProductController.getAccomBuildingProduct 실행");

		// [사용자] 숙소-건물 목록 조회
		List<AccomBuilding> accomBuilding = productService.getAccomBuildingList(currentPage, ROW_PER_PAGE);
//		log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
		model.addAttribute("accomBuilding", accomBuilding);
		log.debug("[debug] ProductController.getAccomBuildingProduct accomBuilding : " + accomBuilding);
		
		// [사용자] 숙소-건물 시설 인기 조회
		List<Map<String, Object>> facilityByBest = productService.getAccomBuildingFacilityByBest();
		model.addAttribute("facilityByBest", facilityByBest);
		log.debug("[debug] ProductController.getAccomBuildingProduct facilityByBest : " + facilityByBest);
		
		// [사용자] 숙소-건물 지역 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getAccomAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("[debug] ProductController.getAccomBuildingProduct addressZipByBest : " + addressZipByBest);
		
		return "/product/getAccomBuildingProductList";
	}
	
	@PostMapping("/getAccomProductList")
	public String getAccomBuildingProduct(Model model,
										@RequestParam @Nullable String searchWord, 
										@RequestParam @Nullable String searchAccomAddress,
										@RequestParam @Nullable List<String> searchFacilityList,
										@RequestParam @Nullable Integer searchReviewScore,
										@RequestParam @Nullable String searchPrice
										) {
		List<String> searchPriceList = new ArrayList<>();
		if(searchPrice != null) {
			searchPriceList = Arrays.asList(searchPrice.split(";"));
		}
		log.debug("[debug] ProductController.getAccomBuildingProduct searchWord : " + searchWord);
		log.debug("[debug] ProductController.getAccomBuildingProduct searchAccomAddress : " + searchAccomAddress);
		log.debug("[debug] ProductController.getAccomBuildingProduct searchFacilityList : " + searchFacilityList);
		log.debug("[debug] ProductController.getAccomBuildingProduct searchReviewScore : " + searchReviewScore);
		log.debug("[debug] ProductController.getAccomBuildingProduct searchPrice : " + searchPriceList);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);
		paramMap.put("searchAccomAddress", searchAccomAddress);
		paramMap.put("searchFacilityList", searchFacilityList);
		paramMap.put("searchReviewScore", searchReviewScore);
		paramMap.put("searchPriceList", searchPriceList);
		
		// [사용자] 숙소-건물 목록 검색 조회
		List<AccomBuilding> accomBuilding = productService.getAccomBuildingListBySearch(paramMap);
//				log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
		model.addAttribute("accomBuilding", accomBuilding);
		log.debug("[debug] ProductController.getAccomBuildingProduct accomBuilding : " + accomBuilding);
		
		// [사용자] 숙소-건물 시설 인기 조회
		List<Map<String, Object>> facilityByBest = productService.getAccomBuildingFacilityByBest();
		model.addAttribute("facilityByBest", facilityByBest);
		log.debug("[debug] ProductController.getAccomBuildingProduct facilityByBest : " + facilityByBest);
		
		// [사용자] 숙소-건물 지역 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getAccomAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("[debug] ProductController.getAccomBuildingProduct addressZipByBest : " + addressZipByBest);
				
		return "/product/getAccomBuildingProductList";
	}
	
	@GetMapping("/getActivityProductList")
	public String getActivityProduct(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		log.debug("[debug] ProductController.getActivityProduct 실행");
		
		// [사용자] 체험 목록 조회
		List<Activity> activity = productService.getActivityList(currentPage, ROW_PER_PAGE);
		model.addAttribute("activity", activity);
		log.debug("[debug] ProductController.getActivityProduct activity : " + activity);

		// [사용자] 체험 지역 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getActivityAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("[debug] ProductController.getActivityProduct addressZipByBest : " + addressZipByBest);
		
		return "/product/getActivityProductList";
	}
	
	@GetMapping("/setProductCategory")
	public String setProductCategory() {
		log.debug("ProductController.setProductCategory 실행");
	      
		return "/product/setProductCategory";
	}
	
	@GetMapping("/accomBuildingOne")
	public String getAccombuildingOne(Model model) {
		log.debug("ProductController.getAccombuildingOne 실행");
		int accomBuildingNo = 34;
		AccomBuilding accomBuilding = productService.getAccombuildingOne(accomBuildingNo);
		model.addAttribute("accomBuilding", accomBuilding);
		return "/product/testAccomOne";
	}
	
}
