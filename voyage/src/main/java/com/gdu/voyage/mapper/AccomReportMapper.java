package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomReport;

@Mapper
public interface AccomReportMapper {
	// [Member] 신고 작성
	int addReport(AccomReport report);
	
	// [Admin] 신고 목록
	List <AccomReport> selectReportAll(Map<String, Object> param);
	
	// [Admin] 신고 상세 내용
	AccomReport selectReportOne(int reportNo);
	
	// 페이징 할 때 사용할 총 신고 수
	int reportTotalCount(String searchWord);

}
