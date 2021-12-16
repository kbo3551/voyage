package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.AccomRoomImage;
import com.gdu.voyage.vo.AccomRoomItem;
import com.gdu.voyage.vo.Hashtag;

public interface AccomRoomMapper {
	List<AccomRoom> selectAccomRoomList(Map<String, Object> param);
	
	// 사업자
	// 숙소-객실 입력 : 숙소-객실정보 + 이미지 + 시설 + 추천장소 + 물품옵션
	int insertAccomRoom(AccomRoom accomRoom);
	int insertAccomRoomImage(AccomRoomImage accomRoomImage);
	int insertAccomRoomItem(AccomRoomItem accomRoomItem);
	int insertAccomRoomHashtag(Hashtag Hashtag);
}
