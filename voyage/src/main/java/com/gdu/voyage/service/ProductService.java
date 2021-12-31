package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ProductMapper;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ProductService {
	@Autowired ProductMapper productMapper;
	
	// [사용자] 숙소-건물 목록 조회
	public List<AccomBuilding> getAccomBuildingList(int currentPage, int ROW_PER_PAGE) {
		log.debug("[debug] ProductService.getAccomBuildingList currentPage : " );
		log.debug("[debug] ProductService.getAccomBuildingList ROW_PER_PAGE : " );
		
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		List<AccomBuilding> accomBuildingList = productMapper.selectAccomBuildingList();
		// accomBuildingList 가공 - 해시태그 링크 연결을 위해 accomBuildingList 에서 Hahstag 분리
//		List<String> hashtagList = new ArrayList<>();
//		for(int i=0; i<accomBuildingList.size(); i++) {
//			hashtagList.add(accomBuildingList.get(i).getHashtagList().get(0).getHashtag());
//		}
		
//		Map<String, Object> returnMap = new HashMap<>();
//		returnMap.put("accomBuildingList", accomBuildingList);
//		returnMap.put("hashtagList", hashtagList);
		log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);
//		log.debug("[debug] ProductService.getAccomBuildingList hashtagList : " + hashtagList);
		
		return accomBuildingList;
	}
	
	// [사용자] 숙소-건물 시설 인기 조회
	public List<Map<String, Object>> getAccomBuildingFacilityByBest() {
		List<Map<String, Object>> facilityByBest = productMapper.selectAccomBuildingFacilityByBest();
		log.debug("[debug] ProductService.getAccomBuildingFacilityByBest facilityByBest : " + facilityByBest);
		return facilityByBest;
	}
	
	// [사용자] 숙소-건물 지역 인기 조회
	public List<Map<String, Object>> getAccomAddressByBest() {
		List<Map<String, Object>> addressZipByBest = productMapper.selectAccomAddressByBest();
		log.debug("[debug] ProductService.getAccomAddressByBest addressZipByBest : " + addressZipByBest);
		return addressZipByBest;
	}
		
	// [사용자] 숙소-건물 목록 검색 조회
	public List<AccomBuilding> getAccomBuildingListBySearch(Map<String, Object> param) {
		log.debug("[debug] ProductService.getAccomBuildingListBySearch param : " + param);
		
		List<AccomBuilding> accomBuildingList = productMapper.selectAccomBuildingListBySearch(param);
		
		log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);
		return accomBuildingList;
	}
		
	// [사용자] 숙소-건물 상세 조회
	public AccomBuilding getAccombuildingOne (int accomBuildingNo) {
		return productMapper.selectAccomBuildingOne(accomBuildingNo);
	}
	
	// [사용자] 숙소-건물-객실 목록 조회
	public List<AccomRoom> getAccomRoomList(int accomBuildingNo, int currentPage, int ROW_PER_PAGE) {
		log.debug("[debug] ProductService.getAccomRoomList currentPage : " );
		log.debug("[debug] ProductService.getAccomRoomList ROW_PER_PAGE : " );
		
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		List<AccomRoom> accomRoomList = productMapper.selectAccomRoomList(accomBuildingNo);
		// accomBuildingList 가공 - 해시태그 링크 연결을 위해 accomBuildingList 에서 Hahstag 분리
//			List<String> hashtagList = new ArrayList<>();
//			for(int i=0; i<accomBuildingList.size(); i++) {
//				hashtagList.add(accomBuildingList.get(i).getHashtagList().get(0).getHashtag());
//			}
		
//			Map<String, Object> returnMap = new HashMap<>();
//			returnMap.put("accomBuildingList", accomBuildingList);
//			returnMap.put("hashtagList", hashtagList);
		log.debug("[debug] ProductService.getAccomRoomList accomRoomList : " + accomRoomList);
//			log.debug("[debug] ProductService.getAccomBuildingList hashtagList : " + hashtagList);
		
		return accomRoomList;
	}
	
	// [사용자] 숙소-건물-객실 상세 조회
	public AccomRoom getAccomRoomOne (int accomRoomNo) {
		return productMapper.selectAccomRoomOne(accomRoomNo);
	}	
	
	// [사용자] 체험 목록 조회
	public List<Activity> getActivityList(int currentPage, int ROW_PER_PAGE) {
		log.debug("[debug] ProductService.getActivityList currentPage : " );
		log.debug("[debug] ProductService.getActivityList ROW_PER_PAGE : " );
		
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		List<Activity> activityList = productMapper.selectActivityList();
		
		log.debug("[debug] ProductService.getActivityList activityList : " + activityList);
		return activityList;
	}
	// [사용자] 체험 지역 인기 조회
	public List<Map<String, Object>> getActivityAddressByBest() {
		List<Map<String, Object>> addressZipByBest = productMapper.selectActivityAddressByBest();
		log.debug("[debug] ProductService.getActivityAddressByBest addressZipByBest : " + addressZipByBest);
		return addressZipByBest;
	}
	
	// [사용자] 체험 목록 검색 조회
	public List<Activity> getActivityListBySearch(Map<String, Object> param) {
		log.debug("[debug] ProductService.getActivityListBySearch param : " + param);
		
		List<Activity> activityList = productMapper.selectActivityListBySearch(param);
		
		log.debug("[debug] ProductService.getActivityList activityList : " + activityList);
		return activityList;
	}

	// [사용자] 체험 상세 조회
	public Activity getActivityOne (int activityNo) {
		return productMapper.selectActivityOne(activityNo);
	}
	
	// [사용자] 체험 상세-목록 조회
//	public List<Activity> getActivityOneList() {
//		
//		List<Activity> activityOneList = productMapper.selectActivityOneList();
//		
//		log.debug("[debug] ProductService.getActivityOneList activityOneList : " + activityOneList);
//		return activityOneList;
//	}
}
