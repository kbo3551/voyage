package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	// 숙소 - 건물 정보 조회
	List<Map<String, Object>> selectAccomBuilding();
	// 숙소 - 건물 정보 조회
	List<Map<String, Object>> selectAccomBuildingFacility(int accomBuildingNo);
}
