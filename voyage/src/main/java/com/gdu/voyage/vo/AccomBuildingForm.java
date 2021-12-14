package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AccomBuildingForm {
	private AccomBuilding accomBuilding;
	private List<MultipartFile> accomBuildingImage;
	private AccomAddress accomAddress;
	private List<AccomBuildingFacility> accomBuildingFacility;
	private List<AccomSpotForm> accomSpotForm;
	//private List<AccomBuildingSpot> accomBuildingSpot;
	//private List<SpotAddress> SpotAddress;
	private List<Hashtag> hashtag;
}
