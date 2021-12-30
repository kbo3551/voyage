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
import com.gdu.voyage.vo.QnaAnswer;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnaService {
	@Autowired QnaMapper qnaMapper;
	
	// Qna 게시판 목록 상세 내용
	public Qna getQnaOneAndAnswer(int qnaNo) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] selectQnaOne debug >>>" + qnaMapper.selectQnaOneAndAnswer(qnaNo));
		Qna qna = null;
		qna = qnaMapper.selectQnaOneAndAnswer(qnaNo);
		return qna;
	}
	// Qna 게시판 목록 검색어 별 조회
	public Map<String, Object> getQnaList(String searchWord,int currentPage, int rowPerPage){
		// 매개변수 값 가공
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paramMap.put("searchWord", searchWord);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Qna> qnaList = qnaMapper.selectQnaList(paramMap);
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_getQnaList_qnaList debug" + qnaList.toString());
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		// 마지막 페이지
		int lastPage = 0;
		int totalCount = qnaMapper.selectQnaTotalCount(searchWord);
		lastPage = (totalCount / rowPerPage);
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("qnaList", qnaList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount",totalCount);
		returnMap.put("searchWord",searchWord);
		
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_getQnaList_returnMap debug" + returnMap);		
		return returnMap;
	}
	
	// [Member] Qna 게시판 질문 수정
	public int modifyQ(Qna qna, QnaImg qnaImg) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_modifyQ_Qna debug" + qnaMapper.modifyQ(qna));
		return qnaMapper.modifyQ(qna);
	}
	// [Member] Qna 게시판 질문 삭제
	public int removeQ(Qna qna) {
		log.debug(qna.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_removeQ_Qna debug");
		return qnaMapper.removeQ(qna);
	}
	// [Member] Qna 게시판 질문 작성
	@Transactional
	public void addQ(QnaForm qnaForm, String realPath) throws Exception {
		// qnaForm값 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaForm debug" + qnaForm.toString());
		qnaMapper.addQ(qnaForm);
		/*
		// 이미지 추가
		MultipartFile qImgList = qnaForm.getQnaImg();
		// 이미지가 업로드 되었을 경우
		if(qImgList != null) {
			QnaImg qnaImg = new QnaImg();
			// qnaImg의 QnaNo 셋팅
			qnaImg.setQnaNo(qnaForm.getQnaNo());
			// 원본 이미지 파일 이름
			String originalImgname = qImgList.getOriginalFilename(); 
			// 마지막 점의 위치
			int p = originalImgname.lastIndexOf("."); 
			String ext = originalImgname.substring(p+1);
			// 중복되지 않는 문자 이름 생성
			String prename = UUID.randomUUID().toString().replace("-", "");
			String imgname = prename;
				
			qnaImg.setQnaImgName(imgname);
			qnaImg.setQnaImgExt(ext);
			qnaImg.setQnaImgSize(qImgList.getSize());
			// qnaImg 값 디버깅 코드
			log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaForm debug" + qnaImg);
			// 테이블에 값 저장
			qnaMapper.addQImg(qnaImg);
				
			File f = new File(realPath+imgname+"."+ext);
			try {
				qImgList.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				// IllegalStateException | IOException e 예외처리를 무조건 해야하는 예외
				// RuntimeException은 예외처리를 하지 않아도 됨
				throw new RuntimeException();
			}
			
		}
		*/
	}
	
	// [Admin] 답변 없는 질문 목록
	public Map<String, Object> getNoneAnswerQ(int currentPage, int rowPerPage, String qnaCategory){
		int beginRow = (currentPage - 1) * rowPerPage; 
		// 매개변수 값 가공 
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("qnaCategory", qnaCategory);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Qna> noneAnswerQnaList = qnaMapper.selectNoneAnswerQ(paramMap);
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("noneAnswerQnaList", noneAnswerQnaList);
		// 마지막 페이지
		int lastPage = 0;
		int totalCount = qnaMapper.selectQnaTotalCount(qnaCategory);
		lastPage = (totalCount / rowPerPage);
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("noneAnswerQnaList", noneAnswerQnaList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		return returnMap;
	}
	// [Admin] 답변 작성
	public void addA(QnaAnswer qnaAnswer) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_addA_debug" + qnaMapper.addA(qnaAnswer));
		qnaMapper.addA(qnaAnswer);
	}
}

