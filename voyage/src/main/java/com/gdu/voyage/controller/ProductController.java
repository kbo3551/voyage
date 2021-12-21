package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingFacility;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired ProductService productService;
	
	private final int ROW_PER_PAGE = 6;
	
	@GetMapping("/getAccomProductList")
	public String getAccomBuildingProduct(Model model, @RequestParam(defaultValue = "1") int currentPage) {
		log.debug("[debug] ProductController.getAccomBuildingProduct 실행");

		// 숙소-건물 목록 조회
		List<AccomBuilding> accomBuilding = productService.getAccomBuildingList(currentPage, ROW_PER_PAGE);
//		log.debug("[debug] accomBuilding.get(0).getAccomBuildingName() "+accomBuilding.get(0).getAccomBuildingName());
		model.addAttribute("accomBuilding", accomBuilding);
		log.debug("accomBuilding ProductController.getAccomBuildingProduct accomBuilding : " + accomBuilding);
		
		// 숙소-건물 시설 인기 조회
		List<Map<String, Object>> facilityByBest = productService.getAccomBuildingFacilityByBest();
		model.addAttribute("facilityByBest", facilityByBest);
		log.debug("accomBuilding ProductController.getAccomBuildingProduct facilityByBest : " + facilityByBest);
		// 숙소-건물 시설 인기 조회
		List<Map<String, Object>> addressZipByBest = productService.getAccomAddressByBest();
		model.addAttribute("addressZipByBest", addressZipByBest);
		log.debug("accomBuilding ProductController.getAccomBuildingProduct addressZipByBest : " + addressZipByBest);
		
		return "/product/getAccomBuildingProductList";
	}
	
	
	
	@GetMapping("/getActivityProductList")
	public String getActivityProduct() {
		log.debug("ProductController.getActivityProduct 실행");
	    
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
