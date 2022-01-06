package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.voyage.mapper.ReportMapper;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReportService {
	@Autowired ReportMapper reportMapper;
	
	// [member] 신고 작성
	public int addReport(Report report, int idenNo, String table, String memberId) {
		report.setMemberId(memberId);
		report.setIdenNo(idenNo);
		report.setTable(table);
		// 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_report debug" + report.toString());
		reportMapper.addReport(report);
		return reportMapper.addReport(report);
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
		
		List<Report> reportList = reportMapper.reportList(paramMap);
		// reportList 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_getReportList_reportList debug" + reportList.toString());
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		// 마지막 페이지를 나타내는 변수 lastPage값 0으로 초기화
		int lastPage = 0;
		// 전체 신고 수
		int totalCount = reportMapper.reportTotalCount(searchWord);
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
	// [admin] 신고 내용 상세
	public Report getReportOne(int reportNo) {
		Report report = new Report();
		report = reportMapper.selectReportOne(reportNo);
		// 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] ReportService_getReportOne_report debug" + report.toString());
		
		return report;
	}
}
