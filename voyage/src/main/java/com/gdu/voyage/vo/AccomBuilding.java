package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class AccomBuilding {
	private int accomBuildingNo;
	private int hostNo;
	private String accomBuildingName;
	private String accomBuildingDescription;
	private String accomBuildingPhone;
	private String accomBuildingState;
	private String createDate;
	private String updateDate;
	
	// 1:N - AccomBuildingImage
	private List<AccomBuildingImage> accomBuildingImageList;
	// 1:N - AccomBuildingFacility
	private List<AccomBuildingFacility> accomBuildingFacilityList;
	// 1:N - AccomBuildingSpot
	private List<AccomBuildingSpot> accomBuildingSpotList;
	// 1:N - Hashtag
	private List<Hashtag> hashtagList;
}
