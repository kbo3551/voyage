package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Report;

@Mapper
public interface ReportMapper {
	// [Member] 신고 작성
	int addReport(Report report);
	
	// [Admin] 신고 목록
	List <Report> reportList(Map<String, Object> param);
	
	// [Admin] 신고 상세 내용
	Report selectReportOne(int reportNo);
	
	// 페이징 할 때 사용할 총 신고 수
	int reportTotalCount(String searchWord);
}
