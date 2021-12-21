package com.gdu.voyage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	
	// 사업자
	// 개인별 숙소 조회 list
	List<AccomBuilding> selectAccomBuildingListByHost(int hostNo);
	// 갯수
	int selectReqAccomBuildingCountByHost(int hostNo);
	
	// 사업자
	// 개인별 신청중인 숙소 조회 list
	List<AccomBuilding> selectReqAccomBuildingListByHost(int hostNo);
	
	// 관리자
	// 숙소 조회 list
	List<AccomBuilding> selectAccomBuildingList(int pageNo);
	int selectCountPage();
	
	// 숙소 상세 조회 one
	AccomBuilding selectAccomBuildingOne(int accomBuildingNo);
	
	// 숙소 공개,승인여부 수정
	int accomBuildingUpdate(AccomBuilding accomBuilding);
	
	// 승인완료된 숙소 목록
	List<AccomBuilding> selectAccessAccomBuilding();
}
