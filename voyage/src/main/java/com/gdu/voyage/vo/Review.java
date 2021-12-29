package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class Review {
	private int reviewNo;
	private int paymentNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewStar;
	private String reviewViewCnt;
	private String createDate;
	private String updateDate;
	private List<AccomReviewImage> accomReviewImage;
	private List<ActivityReviewImage> activityReviewImage;
    Integer rating;
}
