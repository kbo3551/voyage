package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.ActivityReview;

@Mapper
public interface ActivityReviewMapper {

	// 체험 후기 전체 목록
	List<ActivityReview> selectActivityReviewList (Map<String, Object> param);
	
	// 체험 후기 게시글 수
	int selectReviewTotalCount(String Review);
	
	// 페이지 수
	int selectCountPage();
}
