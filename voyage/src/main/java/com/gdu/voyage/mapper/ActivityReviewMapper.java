package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.ActivityReview;
import com.gdu.voyage.vo.ActivityReviewImage;

@Mapper
public interface ActivityReviewMapper {

	// 숙소 후기 추가 (숙소 체크아웃 끝나고 등록가능 accom_payment 테이블과 조인해서 체크아웃확인후 등록)
	int addActivityReview(ActivityReview activityReview);
		
	
	// 체험 후기 전체 목록
	List<ActivityReview> selectActivityReviewList (Map<String, Object> param);
	
	// 체험 후기 게시글 수
	int selectReviewTotalCount(Integer activityPaymentNo);
	
	// 페이지 수
	int selectCountPage();
	
	// 이미지 추가
	int addActivityReviewImage(ActivityReviewImage activityReviewImage);
	
	// 이미지 삭제
	int removeActivityReviewImage(int activityReviewNo);
}
