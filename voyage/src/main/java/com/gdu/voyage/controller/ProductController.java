package com.gdu.voyage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityPayment;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired ProductService productService;
	
	private final int ROW_PER_PAGE = 6;
	
	// [사용자] 숙소
   @GetMapping("/getAccomProductList")
   public String getAccomBuildingList(Model model,
		   					  HttpServletRequest request,
                              @RequestParam(defaultValue = "1") int page,
                              @RequestParam @Nullable String searchWord, 
                              @RequestParam @Nullable String searchAddress,
                              @RequestParam @Nullable List<String> searchFacilityList,
                              @RequestParam @Nullable Integer searchReviewScore,
                              @RequestParam @Nullable String searchPrice
                              ) {
      log.debug("[debug] ProductController.getAccomBuildingList 실행");
      
      // 페이징
      int beginRow = (page * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
      int pageNo = ((beginRow / 100) * 10 + 1);
      
      
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
      
      String facilityList = null;
      // 시설 리스트 String으로 변환
      if(searchFacilityList != null) {
    	  facilityList = searchFacilityList.stream().map(n -> String.valueOf(n))
    			  		.collect(Collectors.joining("|"));
      }
      
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("searchWord", searchWord);
      paramMap.put("searchAddress", searchAddress);
      paramMap.put("searchFacilityList", facilityList);
      paramMap.put("minPrice",  minPrice);
      paramMap.put("maxPrice",  maxPrice);
      paramMap.put("page",  page);
      paramMap.put("ROW_PER_PAGE",  ROW_PER_PAGE);
      
      Map<String, Object> accomMap = new HashMap<>();
      
      // 검색 조회와 일반 조회 분기
      if(searchWord != null || searchAddress != null || searchFacilityList != null || searchPrice != null) {
         // [사용자] 숙소-건물 목록 검색 조회
    	  accomMap = productService.getAccomBuildingListBySearch(paramMap);
//			               log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
    	  
         log.debug("[debug] ProductController.getAccomBuildingList accomBuilding : " + accomMap);
      } else {
         // [사용자] 숙소-건물 목록 조회
    	  accomMap = productService.getAccomBuildingList(page, ROW_PER_PAGE,null);
//			         log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
    	  
    	  
    	  
         log.debug("[debug] ProductController.getAccomBuildingList accomBuilding : " + accomMap);
      }
      
      if(accomMap.get("totalCount") == null) {
    	  model.addAttribute("msg", "검색 결과가 없습니다.");
	  	    model.addAttribute("url", "redirect:/getAccomProductList");
	  	    return "/alert";
      }

      
      model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
	  model.addAttribute("beginRow", beginRow);
      model.addAttribute("accomBuilding", accomMap.get("accomBuildingList"));
      model.addAttribute("lastPage", accomMap.get("lastPage"));
      model.addAttribute("totalCount", accomMap.get("totalCount"));
      model.addAttribute("page", page);
      model.addAttribute("pageNo", pageNo);
            
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
		Map<String, Object> accomBuildingMap = productService.getAccomBuildingList(currentPage, ROW_PER_PAGE,2);
		
		
		model.addAttribute("accomBuildingOneList", accomBuildingMap.get("accomBuildingOneList"));
		
		log.debug("[debug] ProductController.getAccomBuildingOne accomBuildingOneList : " + accomBuildingMap.get("accomBuildingOneList"));
		
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
                                @RequestParam(defaultValue = "1") int page,
                                @RequestParam @Nullable String searchWord, 
                                @RequestParam @Nullable String searchAddress,
                                @RequestParam @Nullable Integer searchReviewScore,
                                @RequestParam @Nullable String searchPrice
                                ) {
        log.debug("[debug] ProductController.getActivityProduct 실행");
        
        // 페이징
        int beginRow = (page * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
        int pageNo = ((beginRow / 100) * 10 + 1);
      
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
        paramMap.put("page",  page);
        paramMap.put("ROW_PER_PAGE",  ROW_PER_PAGE);
      
        Map<String, Object> activityMap = new HashMap<>();
      
        // 검색 조회와 일반 조회 분기
        if(searchWord != null || searchAddress != null ||  searchReviewScore != null || searchPrice != null) {
           // [사용자] 체험 목록 검색 조회
        	activityMap = productService.getActivityListBySearch(paramMap);
//		               log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());

        } else {
           // [사용자] 체험 목록 조회
        	activityMap = productService.getActivityList(page, ROW_PER_PAGE,null);
        	
        }
        
        if(activityMap.get("totalCount") == null) {
      	  model.addAttribute("msg", "검색 결과가 없습니다.");
  	  	    model.addAttribute("url", "redirect:/getActivityProductList");
  	  	    return "/alert";
        }
        
        model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
  	    model.addAttribute("beginRow", beginRow);
        model.addAttribute("activity", activityMap.get("activityList"));
        model.addAttribute("lastPage", activityMap.get("lastPage"));
        model.addAttribute("totalCount", activityMap.get("totalCount"));
        model.addAttribute("page", page);
        model.addAttribute("pageNo", pageNo);

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
		Map<String,Object> activityMap = productService.getActivityList(currentPage, ROW_PER_PAGE,2);
		
		@SuppressWarnings("unchecked")
		List<Activity> activityOneList = (List<Activity>) activityMap.get("activityList") ;
		model.addAttribute("activityOneList", activityOneList);
		log.debug("[debug] ProductController.getActivityOne activityOneList : " + activityOneList);
		
		return "/product/activityOne";
	}
	
	// 숙소 예약
	@GetMapping("/member/calendarAccom")
	public String getAccomCalendar(Model model, int accomRoomNo) {
		log.debug("[debug] ProductController.getAccomCalendar 실행");
		log.debug("[debug] ProductController.getAccomCalendar accomRoomNo : " + accomRoomNo);
		
		model.addAttribute("accomRoomNo", accomRoomNo);		
		// [사용자] 숙소 예약 캘린더 페이지로 이동
		return "/product/calendarAccom";
	}
	
	@GetMapping("/member/addAccomReservation")
	public String addAccomReservation(Model model, int accomRoomNo, String checkIn, String checkOut) {
		log.debug("[debug] ProductController.addAccomReservation 실행");
		log.debug("[debug] ProductController.addAccomReservation accomRoomNo : " + accomRoomNo);
		log.debug("[debug] ProductController.addAccomReservation checkIn : " + checkIn);
		log.debug("[debug] ProductController.addAccomReservation checkOut : " + checkOut);
		
		// [사용자] 숙소-건물-객실 상세 조회
		AccomRoom accomRoomOne = productService.getAccomRoomOne(accomRoomNo);
		model.addAttribute("accomRoomOne", accomRoomOne);
		log.debug("[debug] ProductController.addAccomReservation accomRoomOne : " + accomRoomOne);

		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		
		return "/product/addAccomReservation";
	}
	
	@GetMapping("/member/loadAccomPayment")
	public String addAccomReservation(HttpSession session, AccomPayment accomPayment, Model model) {
		log.debug("[debug] ProductController.addAccomReservation 실행");

		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		log.debug("[debug] ProductController.addAccomReservation memberId : " + memberId);
		accomPayment.setMemberId(memberId);
		
		log.debug("[debug] ProductController.addAccomReservation accomPayment : " + accomPayment);
		
		productService.addAccomPayment(accomPayment);
		
		return "/product/loadAccomPayment";
	}
	
    @GetMapping("/member/finishAccomPayment")
	public String addAccomPayment() {
		log.debug("[debug] ProductController.addAccomPayment 실행");

		return "/product/finishAccomPayment";
	}
    
    // 체험 예약
    @GetMapping("/member/calendarActivity")
	public String getActivityCalendar(Model model, int activityNo) {
		log.debug("[debug] ProductController.getActivityCalendar 실행");
		log.debug("[debug] ProductController.getActivityCalendar activityNo : " + activityNo);
		
		model.addAttribute("activityNo", activityNo);		
		// [사용자] 체험 예약 캘린더 페이지로 이동
		return "/product/calendarActivity";
	}
	
	@GetMapping("/member/addActivityReservation")
	public String addActivityReservation(Model model, int activityNo, String checkIn, String checkOut) {
		log.debug("[debug] ProductController.addActivityReservation 실행");
		log.debug("[debug] ProductController.addActivityReservation activityNo : " + activityNo);
		//log.debug("[debug] ProductController.addActivityReservation checkIn : " + checkIn);
		//log.debug("[debug] ProductController.addActivityReservation checkOut : " + checkOut);
		
		// [사용자] 체험 상세 조회
		Activity activityOne = productService.getActivityOne(activityNo);
		model.addAttribute("activityOne", activityOne);
		log.debug("[debug] ProductController.getActivityOne activityOne : " + activityOne);

		//model.addAttribute("checkIn", checkIn);
		//model.addAttribute("checkOut", checkOut);
		
		return "/product/addActivityReservation";
	}
	
	@GetMapping("/member/loadActivityPayment")
	public String addActivityReservation(HttpSession session, ActivityPayment activityPayment, Model model) {
		log.debug("[debug] ProductController.addActivityReservation 실행");

		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		log.debug("[debug] ProductController.addActivityReservation memberId : " + memberId);
		activityPayment.setMemberId(memberId);
		
		log.debug("[debug] ProductController.addActivityReservation activityPayment : " + activityPayment);
		
		productService.addActivityPayment(activityPayment);
		
		return "/product/loadActivityPayment";
	}
	
    @GetMapping("/member/finishActivityPayment")
	public String addActivityPayment() {
		log.debug("[debug] ProductController.addActivityReservation 실행");

		return "/product/finishActivityPayment";
	}
		
	@GetMapping("/setProductCategory")
	public String setProductCategory() {
		log.debug("ProductController.setProductCategory 실행");
	      
		return "/product/setProductCategory";
	}
}
