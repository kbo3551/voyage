package com.gdu.voyage.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.bytecode.stackmap.MapMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired ProductService productService;
	
	private final int ROW_PER_PAGE = 6;
	
	// [사용자] 숙소
   @GetMapping("/getAccomProductList")
   public String getAccomBuildingList(Model model,
                              @RequestParam(defaultValue = "1") int currentPage,
                              @RequestParam @Nullable String searchWord, 
                              @RequestParam @Nullable String searchAddress,
                              @RequestParam @Nullable List<String> searchFacilityList,
                              @RequestParam @Nullable Integer searchReviewScore,
                              @RequestParam @Nullable String searchPrice
                              ) {
      log.debug("[debug] ProductController.getAccomBuildingList 실행");
      Integer minPrice = 0;
      Integer maxPrice = 10000000;
      // 검색 시 사용할 매개변수 가공
      if(searchPrice != null) {
         String[] price = searchPrice.split(";");
         minPrice = Integer.parseInt(price[0]);
         maxPrice = Integer.parseInt(price[1]);
         if(maxPrice==0) {
            maxPrice = 10000000;
         }
      }
      
      log.debug("[debug] ProductController.getAccomBuildingList searchWord : " + searchWord);
      log.debug("[debug] ProductController.getAccomBuildingList searchAddress : " + searchAddress);
      log.debug("[debug] ProductController.getAccomBuildingList searchFacilityList : " + searchFacilityList);
      log.debug("[debug] ProductController.getAccomBuildingList searchReviewScore : " + searchReviewScore);
      log.debug("[debug] ProductController.getAccomBuildingList minPrice : " + minPrice);
      log.debug("[debug] ProductController.getAccomBuildingList maxPrice : " + maxPrice);
      
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("searchWord", searchWord);
      paramMap.put("searchAddress", searchAddress);
      paramMap.put("searchFacilityList", searchFacilityList);
      paramMap.put("minPrice",  minPrice);
      paramMap.put("maxPrice",  maxPrice);
      
      List<AccomBuilding> accomBuilding = new ArrayList<>();
      
      // 검색 조회와 일반 조회 분기
      if(searchWord != null || searchAddress != null || searchFacilityList != null || searchPrice != null) {
         // [사용자] 숙소-건물 목록 검색 조회
         accomBuilding = productService.getAccomBuildingListBySearch(paramMap);
//	               log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
         model.addAttribute("accomBuilding", accomBuilding);
         log.debug("[debug] ProductController.getAccomBuildingList accomBuilding : " + accomBuilding);
      } else {
         // [사용자] 숙소-건물 목록 조회
         accomBuilding = productService.getAccomBuildingList(currentPage, ROW_PER_PAGE);
//	         log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
         model.addAttribute("accomBuilding", accomBuilding);
         log.debug("[debug] ProductController.getAccomBuildingList accomBuilding : " + accomBuilding);
      }
            
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
		
		int currentPage = 0;
		
		// [사용자] 숙소-건물 상세 조회
		AccomBuilding accomBuildingOne = productService.getAccombuildingOne(accomBuildingNo);
		model.addAttribute("accomBuildingOne", accomBuildingOne);
		log.debug("[debug] ProductController.getAccomBuildingOne accomBuildingOne : " + accomBuildingOne);
		
		// [사용자] 숙소-건물-객실 목록 조회
		List<AccomRoom> accomRoom = productService.getAccomRoomList(accomBuildingNo, currentPage, ROW_PER_PAGE);
		model.addAttribute("accomRoom", accomRoom);
		log.debug("[debug] ProductController.getAccomBuildingOne accomRoom : " + accomRoom);

		// [사용자] 숙소-건물 상세-목록 조회
		List<AccomBuilding> accomBuildingOneList = productService.getAccomBuildingList(currentPage, ROW_PER_PAGE);
		model.addAttribute("accomBuildingOneList", accomBuildingOneList);
		log.debug("[debug] ProductController.getAccomBuildingOne accomBuildingOneList : " + accomBuildingOneList);
		
		return "/product/accomBuildingOne";
	}
	
	@GetMapping("/accomRoomOne")
	public String getAccomRoomOne(Model model, int accomBuildingNo, int accomRoomNo) {
		log.debug("[debug] ProductController.getAccomRoomOne 실행");
		log.debug("[debug] ProductController.getAccomRoomOne accomRoomNo : " + accomRoomNo);
		
		int currentPage = 0;
		
		// [사용자] 숙소-건물-객실 상세 조회
		AccomRoom accomRoomOne = productService.getAccomRoomOne(accomRoomNo);
		model.addAttribute("accomRoomOne", accomRoomOne);
		log.debug("[debug] ProductController.getAccomRoomOne accomRoomOne : " + accomRoomOne);

		// [사용자] 숙소-건물-객실 상세-목록 조회
		List<AccomRoom> accomRoomOneList = productService.getAccomRoomList(accomBuildingNo, currentPage, ROW_PER_PAGE);
		model.addAttribute("accomRoomOneList", accomRoomOneList);
		log.debug("[debug] ProductController.getAccomBuildingOne accomRoomOneList : " + accomRoomOneList);
		
		return "/product/accomRoomOne";
	}
	
	
	// [사용자] 체험
   @GetMapping("/getActivityProductList")
   public String getActivityProduct(Model model,
                              @RequestParam(defaultValue = "1") int currentPage,
                              @RequestParam @Nullable String searchWord, 
                              @RequestParam @Nullable String searchAddress,
                              @RequestParam @Nullable Integer searchReviewScore,
                              @RequestParam @Nullable String searchPrice
                              ) {
      log.debug("[debug] ProductController.getActivityProduct 실행");
      
      // 검색 시 사용할 매개변수 가공
      Integer minPrice = 0;
      Integer maxPrice = 10000000;
      // 검색 시 사용할 매개변수 가공
      if(searchPrice != null) {
         String[] price = searchPrice.split(";");
         minPrice = Integer.parseInt(price[0]);
         maxPrice = Integer.parseInt(price[1]);
         if(maxPrice==0) {
            maxPrice = 10000000;
         }
      }
      log.debug("[debug] ProductController.getAccomBuildingList searchWord : " + searchWord);
      log.debug("[debug] ProductController.getAccomBuildingList searchAddress : " + searchAddress);
      log.debug("[debug] ProductController.getAccomBuildingList searchReviewScore : " + searchReviewScore);
      log.debug("[debug] ProductController.getAccomBuildingList minPrice : " + minPrice);
      log.debug("[debug] ProductController.getAccomBuildingList maxPrice : " + maxPrice);

      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("searchWord", searchWord);
      paramMap.put("searchAddress", searchAddress);
      paramMap.put("searchReviewScore", searchReviewScore);
      paramMap.put("minPrice",  minPrice);
      paramMap.put("maxPrice",  maxPrice);
      
      List<Activity> activity = new ArrayList<>();
      
      // 검색 조회와 일반 조회 분기
      if(searchWord != null || searchAddress != null ||  searchReviewScore != null || searchPrice != null) {
         // [사용자] 체험 목록 검색 조회
         activity = productService.getActivityListBySearch(paramMap);
//	               log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
         model.addAttribute("activity", activity);
         log.debug("[debug] ProductController.getActivityProduct activity : " + activity);
      } else {
         // [사용자] 체험 목록 조회
         activity = productService.getActivityList(currentPage, ROW_PER_PAGE);
         model.addAttribute("activity", activity);
         log.debug("[debug] ProductController.getActivityProduct activity : " + activity);
      }

      // [사용자] 체험 지역 인기 조회
      List<Map<String, Object>> addressZipByBest = productService.getActivityAddressByBest();
      model.addAttribute("addressZipByBest", addressZipByBest);
      log.debug("[debug] ProductController.getActivityProduct addressZipByBest : " + addressZipByBest);
      
      return "/product/getActivityProductList";
   }
	
	@GetMapping("/activityOne")
	public String getActivityOne(Model model, int activityNo) {
		log.debug("[debug] ProductController.getActivityOne 실행");
		log.debug("[debug] ProductController.getActivityOne activityNo : " + activityNo);
		
		int currentPage = 0;
		
		// [사용자] 체험 상세 조회
		Activity activityOne = productService.getActivityOne(activityNo);
		model.addAttribute("activityOne", activityOne);
		log.debug("[debug] ProductController.getActivityOne activityOne : " + activityOne);
		
		// [사용자] 체험 상세-목록 조회
		List<Activity> activityOneList = productService.getActivityList(currentPage, ROW_PER_PAGE);
		model.addAttribute("activityOneList", activityOneList);
		log.debug("[debug] ProductController.getActivityOne activityOneList : " + activityOneList);
		
		return "/product/activityOne";
	}
	
	@GetMapping("/calendarAccom")
	public String getCalendar(Model model, int accomRoomNo) {
		log.debug("[debug] ProductController.getCalendar 실행");
		log.debug("[debug] ProductController.getCalendar accomRoomNo : " + accomRoomNo);
		
		model.addAttribute("accomRoomNo", accomRoomNo);		
		// [사용자] 숙소 예약 캘린더 페이지로 이동
		return "/product/calendarAccom";
	}
	
	@GetMapping("/addAccomReservation")
	public String addReservation(Model model, int accomRoomNo) {
		log.debug("[debug] ProductController.addReservation 실행");
		log.debug("[debug] ProductController.addReservation accomRoomNo : " + accomRoomNo);
		
		// [사용자] 숙소-건물-객실 상세 조회
		AccomRoom accomRoomOne = productService.getAccomRoomOne(accomRoomNo);
		model.addAttribute("accomRoomOne", accomRoomOne);
		log.debug("[debug] ProductController.addReservation accomRoomOne : " + accomRoomOne);
		
		// 객실 예약 정보 조회
		
		return "/product/addAccomReservation";
	}
	
	@GetMapping("/setProductCategory")
	public String setProductCategory() {
		log.debug("ProductController.setProductCategory 실행");
	      
		return "/product/setProductCategory";
	}
}
