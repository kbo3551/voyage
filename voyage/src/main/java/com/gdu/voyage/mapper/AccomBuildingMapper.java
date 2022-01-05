package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingFacility;
import com.gdu.voyage.vo.AccomBuildingImage;
import com.gdu.voyage.vo.AccomBuildingSpot;
import com.gdu.voyage.vo.Hashtag;
import com.gdu.voyage.vo.AccomAddress;
import com.gdu.voyage.vo.SpotAddress;
@Mapper
public interface AccomBuildingMapper {
	// 사업자
	// 숙소-건물 입력 : 숙소-건물정보 + 이미지 + 시설 + 추천장소 + 해시태그
	int insertAccomBuilding(AccomBuilding accomBuilding);
	int insertAccomBuildingImage(AccomBuildingImage accomBuidingImage);
	int insertAccomBuildingAddress(AccomAddress accomAddress);
	int insertAccomBuildingFacility(AccomBuildingFacility accomBuildingFacility);
	int insertAccomBuildingSpot(AccomBuildingSpot accomBuildingSpot);
	int insertAccomSpotAddress(SpotAddress spotAddress);
	int insertAccomBuildingHashtag(Hashtag Hashtag);
	
	// 숙소-건물 수정 : 숙소-건물정보 + 이미지 + 시설 + 추천장소
	int updateAccomBuilding(AccomBuilding accomBuilding);
	int updateAccomBuildingImage(AccomBuildingImage accomBuidingImage);
	int updateAccomBuildingAddress(AccomAddress accomAddress);
	int updateAccomBuildingFacility(AccomBuildingFacility accomBuildingFacility);
	int updateAccomBuildingSpot(AccomBuildingSpot accomBuildingSpot);
	int updateAccomSpotAddress(SpotAddress spotAddress);
	// 해시태그 삭제
	int deleteAccomBuildingHashtag(Hashtag Hashtag);
	
	// 회원
	// 이미지가 포함된 관심상품 목록
	List<AccomBuilding> selectAccomBuildingByInterest(Map<String, Object> map);
	//갯수
	int selectInterestedAccomBuildingCount(String memberId);
	
	// 관리자, 사업자
	// 사업자별 신청중인 숙소 조회 list
	List<AccomBuilding> selectReqAccomBuildingListByHost(Map<String, Object> map);
	// 갯수
	int selectReqAccomBuildingCountByHost(int hostNo);
	
	// 숙소 조회 list
	List<AccomBuilding> selectAccomBuildingList(Map<String, Object> map);
	int selectCountPage(@RequestParam(value = "hostNo" , required = false) Integer hostNo);
	
	// 숙소 상세 조회 one
	AccomBuilding selectAccomBuildingOne(int accomBuildingNo);
	
	// 숙소 공개,승인여부 수정
	int accomBuildingUpdate(AccomBuilding accomBuilding);
	
	// 승인완료된 숙소 목록
	List<AccomBuilding> selectAccessAccomBuilding();
	
	// 숙소 삭제 요청
	int updateDormantAccomBuilding();
	
	// 숙소 삭제 대기 상태
	int updateDeleteAccomBuilding();
}
