package com.gdu.voyage.service;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.MemberMapper;
import com.gdu.voyage.mapper.QnaMapper;
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QnaService {
	@Autowired private QnaMapper qnaMapper;
	
	// Qna 게시판 목록 상세 내용
	// qnaContent, qnaSecret value => null...
	// mapper까지는 출력했을 때 문제 없었고, service부터 null값 들어옴...
	public Qna getQnaOneAndAnswer(int qnaNo) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] selectQnaOne debug" + qnaMapper.selectQnaOneAndAnswer(qnaNo));
		return qnaMapper.selectQnaOneAndAnswer(qnaNo);
	}
	// Qna 게시판 목록 카테고리 별 조회
	public Map<String, Object> getQnaListByCategory(String qnaCategory, int currentPage, int rowPerPage){
		// 매개변수 값 가공 
		Map<String, Object> paramMap = new HashMap<>();
		
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paramMap.put("qnaCategory", qnaCategory);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Qna> qnaList = qnaMapper.selectQnaListByCategory(paramMap);
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("qnaList", qnaList);
		// 마지막 페이지
		int lastPage = 0;
		int totalCount = qnaMapper.selectQnaTotalCount(qnaCategory);
		lastPage = (totalCount / rowPerPage);
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("qnaList", qnaList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		return returnMap;
	}
	
	// Qna 게시판 질문 수정
	public int modifyQ(Qna qna, QnaImg qnaImg) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_modifyQ_Qna debug" + qnaMapper.modifyQ(qna));
		return qnaMapper.modifyQ(qna);
	}
	// Qna 게시판 질문 삭제
	public int removeQ(Qna qna) {
		log.debug(qna.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_removeQ_Qna debug");
		return qnaMapper.removeQ(qna);
	}
	// Qna 게시판 질문 작성
	public Map<String, Object> addQ(QnaForm qnaForm, Qna qna, QnaImg qnaImg) throws Exception {
		Map<String, Object> addQMap = new HashMap<>();
		
		int addQ = qnaMapper.addQ(qna);
		// addQ값 디버깅 코드
		log.debug(addQ + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_addQ debug");
	
		addQMap.put("addQ", addQ);
		
		// 이미지 추가
		if(qnaForm.getQnaImg() != null) {
			int addQImg = qnaMapper.addQImg(qnaImg);
			log.debug(addQMap.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_addQMap debug");
			addQMap.put("addQImg", addQImg);
		}
		log.debug(addQMap.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_addQMap debug2222");
		
		return addQMap;
	}	
	// 페이징
	public int[] countPage(int currentPage) {
		int[] num = new int[10];
		int listNum = qnaMapper.selectCountPage();
		listNum = (listNum / 10) + (listNum % 10);
		for(int i=1; i<=10; i++) {
			if(currentPage <= 10) {
				num[i-1] = (currentPage / 10) + i;
			} else {
				if(listNum == ((currentPage / 10) * 10) + i) {
					break;
				}
				num[i-1] = ((currentPage / 10) * 10) + i;
			}
		}
		return num;
	}
}

