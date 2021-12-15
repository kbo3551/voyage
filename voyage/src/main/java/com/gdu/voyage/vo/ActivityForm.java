package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ActivityForm {
	private Activity activity;
	private List<MultipartFile> activityImage;
	private ActivityAddress activityAddress;
	private List<ActivitySpotForm> activitySpotForm;
	private List<Hashtag> hashtag;
}
