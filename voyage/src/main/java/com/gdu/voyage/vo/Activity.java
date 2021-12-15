package com.gdu.voyage.vo;

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
	private String activityState;
	private String activityStateAdmin;
	private String createDate;
	private String updateDate;

}
