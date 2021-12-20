package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@CrossOrigin
public class ProductRestController {
	@Autowired ProductService productService;
	
	@GetMapping("/getAccomProductFacilityList")
	public List<Map<String, Object>> getAccomBuildingFacility(Model model, int accomBuildingNo) {
		log.debug("ProductController.getAccomProductFacilityList 실행");
		
		List<Map<String, Object>> accomBuildingFacilityList = productService.getAccomBuildingFacilityList(accomBuildingNo);
		model.addAttribute("accomBuildingFacilityList", accomBuildingFacilityList);
		log.debug("[debug] ProductController.getAccomBuildingProduct accomBuildingFacilityList " + accomBuildingFacilityList);
		
//		List<Map<String, Object>> accomBuildingFacilityList = productService.getAccomBuildingFacilityList(accomBuildingList.get(0).get("accomBuildingNo").toString());
//		model.addAttribute("accomBuildingFacilityList", accomBuildingFacilityList);
//		log.debug("[debug] ProductController.getAccomBuildingProduct accomBuildingFacilityList " + accomBuildingFacilityList);
	    
		return accomBuildingFacilityList;
	}
}
