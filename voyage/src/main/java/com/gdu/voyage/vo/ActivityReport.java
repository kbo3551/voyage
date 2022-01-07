package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class ActivityReport {
	private int activityReportNo;
	private int activityNo;
	private String memberId;
	private String reportCategory;
	private String createDate;
}
