package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Coupon {
	private int couponNo;
	private String couponName;
	private int couponTerms;
	private int couponDiscount;
	private String deadline;
	private String couponState;
	private String createDate;
}
