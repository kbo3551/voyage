package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class ActivityPayment {
	private int activityPaymentNo;
	private int activityNo;
	private String memberId;
	private String activityBookingTime;
	private int activityUsePerson;
	private int activityAmount;
	private String activityPaymentState;
	private String receipt;
	private String createDate;
	
	// 결제내역 설명에 필요
	private Activity activity;
	private ActivityImage activityImage;
}
