package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ActivityReviewForm {
	private ActivityReview activityReview;
	private List <MultipartFile> ActivityReviewImage;
}
