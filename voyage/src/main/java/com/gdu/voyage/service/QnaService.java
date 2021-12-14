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

import com.gdu.voyage.mapper.QnaMapper;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QnaService {
	@Autowired QnaMapper qnaMapper;
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
		return returnMap;
	}
	// Qna 게시판 목록 상세 내용
	public Qna getQnaOneAndAnswer(int qnaNo) {
		log.debug(qnaMapper.selectQnaOneAndAnswer(qnaNo)+"☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaNo debug");
		return qnaMapper.selectQnaOneAndAnswer(qnaNo);
	}
	// Qna 게시판 질문 수정
	public void modifyQ(Qna qna) {
		log.debug(qna.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_modifyQ_Qna debug");
		qnaMapper.modifyQ(qna);
	}
	// Qna 게시판 질문 삭제
	public void removeQ(Qna qna) {
		log.debug(qna.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_removeQ_Qna debug");	
	}
	// Qna 게시판 질문 작성
	public void addQ(QnaForm qnaForm) throws Exception {
		log.debug(qnaForm.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaForm debug");
		
		String qnaContent = qnaForm.getQnaContent();
		List<MultipartFile> Img = qnaForm.getQnaImg();
		
		Qna qna = new Qna();
		qna.setQnaContent(qnaContent);
		qnaMapper.addQ(qna);
		log.debug(qna.getQnaNo() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaNo debug");
		
		// 이미지 추가
		if(qnaForm.getQnaImg() != null) {
			QnaImg qnaImg = new QnaImg();
			qnaImg.setQnaNo(qna.getQnaNo());
			
			// 이미지 파일 이름 설정
			String qnaImgName = UUID.randomUUID().toString();
			qnaImg.setQnaImgName(qnaImgName);
			
			// 이미지 파일 원본 이름
			String qnaImgOriginName = ((MultipartFile) Img).getOriginalFilename();
			// 이미지 파일명 뒤에 .확장자명에서 . 위치
			int p = qnaImgOriginName.lastIndexOf(".");
			String qnaImgExt = qnaImgOriginName.substring(p+1);
			// 뒤에서 .까지(확장자명에서 .까지)
			qnaImg.setQnaImgExt(qnaImgExt); 
			qnaImg.setQnaImgSize(Img.size());
			qnaMapper.addQImg(qnaImg);
			
			// 파일 경로 임시 설정
			File Imgfile = new File(("C:\\Users\\dawon\\voyage\\voyage\\src\\main\\resources\\resources\\assets\\img\\"+ qnaImgName + qnaImgExt));
			// 필요한 exception(IllegalStateException, IOException)이 아닌 다른 exception을 Exception()을 던져 예외 발생시킴
			// 트랜잭션 처리할 때, 필요한 과정임
			try {
				((MultipartFile) Img).transferTo(Imgfile);
				}catch(IllegalStateException | IOException e) {
					e.printStackTrace();
					
					throw new Exception();
				}
			}
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

