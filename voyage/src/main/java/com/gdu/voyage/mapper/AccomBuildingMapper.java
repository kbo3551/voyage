package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingFacility;
import com.gdu.voyage.vo.AccomBuildingImage;
import com.gdu.voyage.vo.AccomBuildingSpot;
import com.gdu.voyage.vo.Hashtag;

@Mapper
public interface AccomBuildingMapper {
	// 숙소-건물 입력 : 숙소-건물정보 + 이미지 + 시설 + 추천장소 + 해시태그
	int insertAccomBuilding(AccomBuilding accomBuilding);
	int insertAccomBuildingImage(AccomBuildingImage accomBuidingImage);
	int insertAccomBuildingFacility(AccomBuildingFacility accomBuildingFacility);
	int insertAccomBuildingSpot(AccomBuildingSpot accomBuildingSpot);
	int insertAccomBuildingHashtag(Hashtag Hashtag);
}
