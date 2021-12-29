package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Review;

@Mapper
public interface ReviewMapper {
	// 숙소 후기 추가 (숙소 체크아웃 끝나고 등록가능 accom_payment 테이블과 조인해서 체크아웃확인후 등록)
	int addAccomReview(Review review);
	
	// 숙소 후기 전체 목록
	List<Review> selectAccomReviewList (Map<String, Object> param);
	
	// 숙소 후기 게시글 수
	int selectReviewTotalCount(String Review);
	
	// 페이지 수
	int selectCountPage();
}