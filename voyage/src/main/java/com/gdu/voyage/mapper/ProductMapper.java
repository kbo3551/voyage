package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;

@Mapper
public interface ProductMapper {
	// 숙소-건물 목록
	// [사용자] 숙소-건물 목록 조회
	List<AccomBuilding> selectAccomBuildingList(Integer beginRow, Integer ROW_PER_PAGE, Integer count);
	// [사용자] 숙소-건물 목록 검색 조회
	List<AccomBuilding> selectAccomBuildingListBySearch(Map<String, Object> param);
	// [사용자] 숙소-건물 시설 인기 조회
	List<Map<String, Object>> selectAccomBuildingFacilityByBest();
	// [사용자] 숙소-건물 지역 인기 조회
	List<Map<String, Object>> selectAccomAddressByBest();
	
	// 숙소-건물 상세
	// [사용자] 숙소-건물 상세 조회
	AccomBuilding selectAccomBuildingOne(int accomBuildingNo);
	
	// 숙소-건물-객실 목록
	// [사용자] 숙소-건물-객실 목록 조회
	List<AccomRoom> selectAccomRoomList(int accomBuildingNo);
	
	// 숙소-건물-객실 상세
	// [사용자] 숙소-건물-객실 상세 조회
	AccomRoom selectAccomRoomOne(int accomRoomNo);
	
	// 체험 목록
	// [사용자] 체험 목록 조회
	List<Activity> selectActivityList();
	// [사용자] 체험 목록 검색 조회
	List<Activity> selectActivityListBySearch(Map<String, Object> param);
	// [사용자] 체험 지역 인기 조회
	List<Map<String, Object>> selectActivityAddressByBest();
	
	// 체험 상세
	// [사용자] 체험 상세 조회
	Activity selectActivityOne(int activityNo);
	
	// 예약
	// 객실 예약 내역 전체 조회
	List<Map<String, Object>> selectAccomRoomReserveDay(int accomRoomNo);
}
