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
	
	// [사용자] 숙소
	@GetMapping("/getAccomProductList")
	public String getAccomBuildingList(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		log.debug("[debug] ProductController.getAccomBuildingList 실행");

		// [사용자] 숙소-건물 목록 조회
		List<AccomBuilding> accomBuilding = productService.getAccomBuildingList(currentPage, ROW_PER_PAGE);
//		log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
		model.addAttribute("accomBuilding", accomBuilding);
		log.debug("[debug] ProductController.getAccomBuildingList accomBuilding : " + accomBuilding);
		
		// [사용자] 숙소-건물 해시태그 조회
//		List<String> hashtag = productService.getAccomBuildingHashtagList();
//		model.addAttribute("hashtag", hashtag);
//		log.debug("[debug] ProductController.getAccomBuildingList hashtag : " + hashtag);
		
		
		// [사용자] 숙소-건물 시설 인기 조회
		List<Map<String, Object>> facilityByBest = productService.getAccomBuildingFacilityByBest();
		model.addAttribute("facilityByBest", facilityByBest);
		log.debug("[debug] ProductController.getAccomBuildingList facilityByBest : " + facilityByBest);
		
		// [사용자] 숙소-건물 지역 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getAccomAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("[debug] ProductController.getAccomBuildingList addressZipByBest : " + addressZipByBest);
		
		return "/product/getAccomBuildingProductList";
	}
	
	@PostMapping("/getAccomProductList")
	public String getAccomBuildingList(Model model,
										@RequestParam @Nullable String searchWord, 
										@RequestParam @Nullable String searchAddress,
										@RequestParam @Nullable List<String> searchFacilityList,
										@RequestParam @Nullable Integer searchReviewScore,
										@RequestParam @Nullable String searchPrice
										) {
		List<String> searchPriceList = new ArrayList<>();
		if(searchPrice != null) {
			searchPriceList = Arrays.asList(searchPrice.split(";"));
		}
		log.debug("[debug] ProductController.getAccomBuildingList searchWord : " + searchWord);
		log.debug("[debug] ProductController.getAccomBuildingList searchAddress : " + searchAddress);
		log.debug("[debug] ProductController.getAccomBuildingList searchFacilityList : " + searchFacilityList);
		log.debug("[debug] ProductController.getAccomBuildingList searchReviewScore : " + searchReviewScore);
		log.debug("[debug] ProductController.getAccomBuildingList searchPrice : " + searchPriceList);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);
		paramMap.put("searchAddress", searchAddress);
		paramMap.put("searchFacilityList", searchFacilityList);
		paramMap.put("searchReviewScore", searchReviewScore);
		paramMap.put("searchPriceList", searchPriceList);
		
		// [사용자] 숙소-건물 목록 검색 조회
		List<AccomBuilding> accomBuilding = productService.getAccomBuildingListBySearch(paramMap);
//				log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
		model.addAttribute("accomBuilding", accomBuilding);
		log.debug("[debug] ProductController.getAccomBuildingList accomBuilding : " + accomBuilding);
		
		// [사용자] 숙소-건물 시설 인기 조회
		List<Map<String, Object>> facilityByBest = productService.getAccomBuildingFacilityByBest();
		model.addAttribute("facilityByBest", facilityByBest);
		log.debug("[debug] ProductController.getAccomBuildingList facilityByBest : " + facilityByBest);
		
		// [사용자] 숙소-건물 지역 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getAccomAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("[debug] ProductController.getAccomBuildingList addressZipByBest : " + addressZipByBest);
				
		return "/product/getAccomBuildingProductList";
	}
	
	@GetMapping("/accomBuildingOne")
	public String getAccomBuildingOne(Model model, int accomBuildingNo) {
		log.debug("[debug] ProductController.getAccomBuildingOne 실행");
		log.debug("[debug] ProductController.getAccomBuildingOne accomBuildingNo : " + accomBuildingNo);
		
		// [사용자] 숙소-건물 상세 조회
		AccomBuilding accomBuilding = productService.getAccombuildingOne(accomBuildingNo);
		model.addAttribute("accomBuilding", accomBuilding);
		log.debug("[debug] ProductController.getAccomBuildingOne accomBuilding : " + accomBuilding);
		
		return "/product/testAccomOne";
	}

	
	// [사용자] 체험
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
	
	@PostMapping("/getActivityProductList")
	public String getActivityProduct(Model model,
										@RequestParam @Nullable String searchWord, 
										@RequestParam @Nullable String searchAddress,
										@RequestParam @Nullable List<String> searchFacilityList,
										@RequestParam @Nullable Integer searchReviewScore,
										@RequestParam @Nullable String searchPrice
										) {
		List<String> searchPriceList = new ArrayList<>();
		if(searchPrice != null) {
			searchPriceList = Arrays.asList(searchPrice.split(";"));
		}
		log.debug("[debug] ProductController.getActivityProduct searchWord : " + searchWord);
		log.debug("[debug] ProductController.getActivityProduct searchAddress : " + searchAddress);
		log.debug("[debug] ProductController.getActivityProduct searchFacilityList : " + searchFacilityList);
		log.debug("[debug] ProductController.getActivityProduct searchReviewScore : " + searchReviewScore);
		log.debug("[debug] ProductController.getActivityProduct searchPrice : " + searchPriceList);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);
		paramMap.put("searchAddress", searchAddress);
		paramMap.put("searchFacilityList", searchFacilityList);
		paramMap.put("searchReviewScore", searchReviewScore);
		paramMap.put("searchPriceList", searchPriceList);
		
		// [사용자] 체험 목록 검색 조회
		List<Activity> activity = productService.getActivityListBySearch(paramMap);
//				log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
		model.addAttribute("activity", activity);
		log.debug("[debug] ProductController.getActivityProduct activity : " + activity);
		
		// [사용자] 체험 지역 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getActivityAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("[debug] ProductController.getActivityProduct addressZipByBest : " + addressZipByBest);
				
		return "/product/getActivityProductList";
	}

	@GetMapping("/activityOnetest")
	public String getActivityOne(Model model, int activityNo) {
		log.debug("[debug] ProductController.getActivityOne 실행");
		log.debug("[debug] ProductController.getActivityOne activityNo : " + activityNo);
		
		// [사용자] 체험 상세 조회
		Activity activity = productService.getActivityOne(activityNo);
		model.addAttribute("activity", activity);
		log.debug("[debug] ProductController.getActivityOne activity : " + activity);
		
		return "/product/activityOne";
	}
	
	@GetMapping("/setProductCategory")
	public String setProductCategory() {
		log.debug("ProductController.setProductCategory 실행");
	      
		return "/product/setProductCategory";
	}
}
