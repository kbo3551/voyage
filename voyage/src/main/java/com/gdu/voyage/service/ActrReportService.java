package com.gdu.voyage.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.voyage.mapper.ActrReportMapper;
import com.gdu.voyage.vo.ActivityReviewReport;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ActrReportService {
	@Autowired ActrReportMapper actrReportMapper;
	
	// [member] 신고 작성
	public int addActrReport(ActivityReviewReport report, int activityReviewNo, String memberId) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_addReport_idenNo debug" + activityReviewNo);
		
		report.setActivityReviewNo(activityReviewNo);
		report.setMemberId(memberId);
		// 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_addReport_report debug" + report.toString());
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_addReport_reportMapper.addReport() debug" + actrReportMapper.addActrReport(report));
		return actrReportMapper.addActrReport(report);
	}
	
	// [admin] 신고 목록
	public Map<String, Object> getReportList(String searchWord, int currentPage, int rowPerPage){
		// 매개변수 값 가공
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		// 검색어
		paramMap.put("searchWord", searchWord);
		
		List<ActivityReviewReport> reportList = actrReportMapper.selectReportAll(paramMap);
		// reportList 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_getReportList_reportList debug" + reportList.toString());
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		// 마지막 페이지를 나타내는 변수 lastPage값 0으로 초기화
		int lastPage = 0;
		// 전체 신고 수
		int totalCount = actrReportMapper.reportTotalCount(searchWord);
		// lastPage 값 셋팅
		lastPage = (totalCount / rowPerPage);
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// returnMap에 필요한 값 저장
		returnMap.put("reportList", reportList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount",totalCount);
		returnMap.put("searchWord",searchWord);
		// 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_getReportList_returnMap debug" + returnMap);		
				
		return returnMap;
	}
}
