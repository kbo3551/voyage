package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ProductMapper;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingFacility;
import com.gdu.voyage.vo.AccomBuildingImage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ProductService {
	@Autowired ProductMapper productMapper;
	
	// 숙소-건물 목록 조회
	public List<Map<String, Object>> getAccomBuildingList(){
		
		List<Map<String, Object>> accomBuildingList = productMapper.selectAccomBuilding();
//		List<AccomBuildingFacility> accomBuildingFacility = productMapper.selectAccomBuildingFacility();
//		List<AccomBuildingImage> accomBuildingImage = productMapper.selectAccomBuildingImage();
		
//		Map<String, Object> accomBuildingList = new HashMap<>();
//		accomBuildingList.put("accomBuilding", accomBuilding);
		
		log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);
		
		return accomBuildingList;
	}
	
	// 숙소-건물 시설 목록 조회
		public List<Map<String, Object>> getAccomBuildingFacilityList(int accomBuildingNo){
			
//			List<Map<String, Object>> accomBuildingFacilityList = productMapper.selectAccomBuildingFacility(accomBuildingNo);
			List<Map<String, Object>> accomBuildingFacilityList = productMapper.selectAccomBuildingFacility(accomBuildingNo);
//			List<AccomBuildingFacility> accomBuildingFacility = productMapper.selectAccomBuildingFacility();
//			List<AccomBuildingImage> accomBuildingImage = productMapper.selectAccomBuildingImage();
			
//			Map<String, Object> accomBuildingList = new HashMap<>();
//			accomBuildingList.put("accomBuilding", accomBuilding);
			
			log.debug("[debug] ProductService.getAccomBuildingList accomBuildingFacilityList : " + accomBuildingFacilityList);
			
			return accomBuildingFacilityList;
		}
}
