package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class ActivityAddress {
	private int activityAddressNo;
	private int activityNo;
	private int activityAddressPostalCode;
	private String activityAddressZip;
	private String activityAddressDetail;
	private String createDate;
	private String updateDate;
}
