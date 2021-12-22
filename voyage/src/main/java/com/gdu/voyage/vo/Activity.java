package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class Activity {
	private int activityNo;
	private int hostNo;
	private String activityName;
	private String activityOpenDate;
	private String activityCloseDate;
	private int activityPrice;
	private String activityOpenHour;
	private String activityCloseHour;
	private int activityMaxT; // 최대이용시간
	private int activityMaxP; // 최대인원
	private String activityDescription;
	private String activityPhone;
	private String activityState;
	private String activityStateAdmin;
	private String createDate;
	private String updateDate;

	// 1:N - ActivityImage
	private List<ActivityImage> activityImageList;
	// 1:1 - ActivityAddress
	private ActivityAddress activityAddress;
	// 1:N - ActivitySpot
	private List<ActivitySpot> activitySpotList;
	// 1:N - Hashtag
	private List<Hashtag> hashtagList;
}
