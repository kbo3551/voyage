package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class AccomReview {
	private int accomReviewNo;
	private int accomPaymentDetails;
	private String accomReviewTitle;
	private String accomReviewContent;
	private int accomReviewStar;
	private int accomReviewViewCnt;
	private String createDate;
	private String updateDate;
	private List<AccomReviewImage> accomReviewImage;
}
