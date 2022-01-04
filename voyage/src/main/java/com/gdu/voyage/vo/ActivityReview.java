package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class ActivityReview {
	private int activityReviewNo;
	private int activityPaymentDetails;
	private String activityReviewTitle;
	private String activityReviewContent;
	private int activityReviewStar;
	private int activityReviewViewCnt;
	private String createDate;
	private String updateDate;
	
	// 후기글 - 이미지 파일 1:N
	private List<ActivityReviewImage> activityReviewImage;
	
	// 검색용
	private String searchReview;
}
