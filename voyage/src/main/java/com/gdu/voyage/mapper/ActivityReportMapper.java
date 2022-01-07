package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.ActivityReport;

@Mapper
public interface ActivityReportMapper {
	// [Member] 신고 작성
	int addActivityReport(ActivityReport report);
		
	// [Admin] 신고 목록
	List <ActivityReport> selectReportAll(Map<String, Object> param);
		
	// 페이징 할 때 사용할 총 신고 수
	int reportTotalCount(String searchWord);
}
