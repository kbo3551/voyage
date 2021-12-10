package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Activity {
	private int activityNo;
	private int hostNo;
	private String activityName;
	private int addressNo;
	private String activityOpenDate;
	private String activityCloseDate;
	private int activityPrice;
	private String activityOpenHour;
	private String activityCloseHour;
	private int activityMaxT;
	private String activityDescription;
	private int activityMaxP;
	private String activityState;
	private String activityStateAdmin;
	private String createDate;
	private String updateDate;
	
}
