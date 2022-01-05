package com.gdu.voyage.service;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.QnaMapper;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaAnswer;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QnaService {
	@Autowired QnaMapper qnaMapper;
		
	// Qna 게시판 목록 상세 내용
	// ISSUE : qnaImg 부분 []로 나오고 내용 안 나옴...
	public Qna getQnaOneAndAnswer(int qnaNo) {
		// 문의글 상세 내용
		Qna qna = new Qna();
		qna = qnaMapper.selectQnaOneAndAnswer(qnaNo);
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_getQnaOneAndAnswer_qna debug >>>" + qna);
		return qna;
	}
	
	// Qna 게시판 목록 조회
	public Map<String, Object> getQnaList(String searchWord, int currentPage, int rowPerPage){
		// 매개변수 값 가공
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		List<Qna> qnaList = qnaMapper.selectQnaList(paramMap);
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_getQnaList_qnaList debug" + qnaList.toString());
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		// 마지막 페이지를 나타내는 변수 lastPage값 0으로 초기화
		int lastPage = 0;
		// 전체 게시글 수
		int totalCount = qnaMapper.selectQnaTotalCount(searchWord);
		// lastPage 값 셋팅
		lastPage = (totalCount / rowPerPage);
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// returnMap에 필요한 값 저장
		returnMap.put("qnaList", qnaList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount",totalCount);
		returnMap.put("searchWord",searchWord);
		// 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_getQnaList_returnMap debug" + returnMap);		
		
		return returnMap;
	}
	
	// [Member] Qna 게시판 질문 수정
	public void modifyQ(QnaForm qnaForm, String realPath, String memberId, String memberNickname) {
		// 매개변수 qnaForm 값 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_modifyQ_Qna debug" + qnaForm.toString());
		//qna에 memberId, memberNickname 저장
		Qna qna = qnaForm.getQna();
		qna.setMemberId(memberId);
		qna.setMemberNickname(memberNickname);
		// 문의글 수정
		qnaMapper.modifyQ(qna);
		// 이미지 추가에 사용할 qnaNo 값 확인
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaNo debug" + qna.getQnaNo());
		// 이미지 추가
		List <MultipartFile> qList = qnaForm.getQnaImg();
		// 이미지가 업로드 되었을 경우
		if(qList != null) {
			for(MultipartFile i : qList) {
				QnaImg qnaImg = new QnaImg();
				// qnaImg의 QnaNo 셋팅
				qnaImg.setQnaNo(qna.getQnaNo());
				// 원본 이미지 파일 이름
				String originalImgname = i.getOriginalFilename(); 
				// 마지막 점의 위치
				int p = originalImgname.lastIndexOf("."); 
				String ext = originalImgname.substring(p+1);
				// 중복되지 않는 문자 이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String imgname = prename;
				// qnaImg에 imgName, imgExt, imgSize 셋팅
				qnaImg.setQnaImgName(imgname);
				qnaImg.setQnaImgExt(ext);
				qnaImg.setQnaImgSize(i.getSize());
				// qnaImg 값 디버깅 코드
				log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaImg debug" + qnaImg.toString());
				// 테이블에 값 저장
				qnaMapper.addQImg(qnaImg);
						
				File f = new File(realPath+imgname+"."+ext);
				try {
					i.transferTo(f);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					// IllegalStateException | IOException e 예외처리를 무조건 해야하는 예외
					// RuntimeException은 예외처리를 하지 않아도 됨
					throw new RuntimeException();
				}
			}
		}
		
	}
	// [Member] Qna 게시판 질문 삭제
	public void removeQ(int qnaNo) {
		log.debug(qnaNo + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_removeQ_Qna debug");
		// 이미지 삭제
		qnaMapper.removeQImg(qnaNo);
		// 문의글 삭제
		qnaMapper.removeQ(qnaNo);
		
	}
	// [Member] Qna 게시판 질문 작성
	public void addQ(QnaForm qnaForm, String realPath, String memberId, String memberNickname) throws Exception {
		// qnaForm값 디버깅 코드
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaForm debug" + qnaForm.toString());
		//qna에 memberId, memberNickname 저장
		Qna qna = qnaForm.getQna();
		qna.setMemberId(memberId);
		qna.setMemberNickname(memberNickname);
		// 문의글 등록
		qnaMapper.addQ(qna);
		// 이미지 추가에 사용할 qnaNo 값 확인
		// qnaNo : auto Increment로 입력 받음
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaNo debug" + qna.getQnaNo());
		// 이미지 추가
		List <MultipartFile> qList = qnaForm.getQnaImg();
		// 이미지가 업로드 되었을 경우
		if(qList != null) {
			for(MultipartFile i : qList) {
				QnaImg qnaImg = new QnaImg();
				// qnaImg의 QnaNo 셋팅
				qnaImg.setQnaNo(qna.getQnaNo());
				// 원본 이미지 파일 이름
				String originalImgname = i.getOriginalFilename(); 
				// 마지막 점의 위치
				int p = originalImgname.lastIndexOf("."); 
				String ext = originalImgname.substring(p+1);
				// 중복되지 않는 문자 이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String imgname = prename;
				// qnaImg에 imgName, imgExt, imgSize 셋팅
				qnaImg.setQnaImgName(imgname);
				qnaImg.setQnaImgExt(ext);
				qnaImg.setQnaImgSize(i.getSize());
				// qnaImg 값 디버깅 코드
				log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaImg debug" + qnaImg.toString());
				// 테이블에 값 저장
				qnaMapper.addQImg(qnaImg);
				
				File f = new File(realPath+imgname+"."+ext);
				try {
					i.transferTo(f);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					// IllegalStateException | IOException e 예외처리를 무조건 해야하는 예외
					// RuntimeException은 예외처리를 하지 않아도 됨
					throw new RuntimeException();
				}
			}
		}

	}
	
	// [Admin] 답변 없는 질문 목록
	public Map<String, Object> getNoneAnswerQ(int currentPage, int rowPerPage, String searchWord){
		int beginRow = (currentPage - 1) * rowPerPage; 
		// 매개변수 값 가공 
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Qna> noneAnswerQnaList = qnaMapper.selectNoneAnswerQ(paramMap);
		// Mapper로부터 호출한 결과값 가공
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("noneAnswerQnaList", noneAnswerQnaList);
		// 마지막 페이지를 나타내는 변수 lastPage값 0으로 초기화
		int lastPage = 0;
		// 전체 게시글 수
		int totalCount = qnaMapper.selectQnaTotalCount(searchWord);
		// lastPage 값 셋팅
		lastPage = (totalCount / rowPerPage);
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// returnMap에 필요한 값 저장
		returnMap.put("noneAnswerQnaList", noneAnswerQnaList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		returnMap.put("searchWord",searchWord);
		return returnMap;
	}
	// [Admin] 답변 작성
	public void addA(QnaAnswer qnaAnswer) {
		log.debug("☆☆☆☆☆☆☆☆☆☆[다원] QnaService_addA_debug" + qnaMapper.addA(qnaAnswer));
		qnaMapper.addA(qnaAnswer);
	}
}

