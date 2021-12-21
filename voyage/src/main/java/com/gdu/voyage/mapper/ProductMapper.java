package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomBuilding;

@Mapper
public interface ProductMapper {
	/* 숙소-건물 목록 */
	// 숙소-건물 목록 조회
	List<AccomBuilding> selectAccomBuildingList();
	// 숙소-건물 시설 인기 조회
	List<Map<String, Object>> selectAccomBuildingFacilityByBest();
	// 숙소-건물 지역 인기 조회
	List<Map<String, Object>> selectAccomAddressByBest();
	
	/* 숙소-건물 상세 */
	// [사용자] 숙소_건물 상세 페이지 출력
	AccomBuilding selectAccomBuildingOne(int accomBuildingNo);
}
