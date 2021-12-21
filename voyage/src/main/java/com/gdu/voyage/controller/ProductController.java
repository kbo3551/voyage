package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.vo.AccomBuilding;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	@Autowired ProductService productService;
	
	@GetMapping("/getAccomProductList")
	public String getAccomBuildingProduct(Model model) {
		log.debug("ProductController.getAccomBuildingProduct 실행");
		
		List<Map<String, Object>> accomBuildingList = productService.getAccomBuildingList();
		model.addAttribute("accomBuildingList", accomBuildingList);
		log.debug("[debug] ProductController.getAccomBuildingProduct accomBuildingList " + accomBuildingList);
		
//		List<Map<String, Object>> accomBuildingFacilityList = productService.getAccomBuildingFacilityList(accomBuildingList.get(0).get("accomBuildingNo").toString());
//		model.addAttribute("accomBuildingFacilityList", accomBuildingFacilityList);
//		log.debug("[debug] ProductController.getAccomBuildingProduct accomBuildingFacilityList " + accomBuildingFacilityList);
	    
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
