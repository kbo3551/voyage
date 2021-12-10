package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AccomBuildingForm {
	private AccomBuilding accomBuilding;
	private List<MultipartFile> AccomBuildingImage;
	private List<AccomBuildingFacility> accomBuildingFacilityList;
	private List<AccomBuildingSpot> accomBuildingSpotList;
	private List<Hashtag> hashtagList;
}
