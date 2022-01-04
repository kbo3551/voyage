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
	
	// 후기글 - 이미지 파일 1:N
	private List<AccomReviewImage> accomReviewImage;
		
	// 검색용
	private String searchReview;
	
}
