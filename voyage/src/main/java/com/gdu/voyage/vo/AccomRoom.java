package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class AccomRoom {
	private int accomRoomNo;
	private int accomBuildingNo;
	private int hostNo;
	private String accomRoomName;
	private int accomRoomPrice;
	private String accomRoomDescription;
	private int accomRoomStan;
	private int accomRoomMax;
	private String accomRoomState;
	private String createDate;
	private String updateDate;
	
	// 1:N
	private AccomBuilding accomBuilding;
	// 1:N
	private List<AccomBuildingFacility> accomBuildingFacilityList;
	// 1:N - AccomRoomImage
	private List<AccomRoomImage> accomRoomImageList;
	// 1:N - AccomRoomItem
	private List<AccomRoomItem> accomRoomItemList;
	// 1:N - Hashtag
	private List<Hashtag> hashtagList;
}
