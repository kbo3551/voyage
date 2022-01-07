package com.gdu.voyage.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.ActivityReviewReport;

@Mapper
public interface ActrReportMapper {
	// [Member] 신고 작성
	int addActrReport(ActivityReviewReport report);
		
	// [Admin] 신고 목록
	List <ActivityReviewReport> selectReportAll(Map<String, Object> param);
		
	// 페이징 할 때 사용할 총 신고 수
	int reportTotalCount(String searchWord);
}
