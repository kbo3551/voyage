package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
	
	public List<QnaImg> getQnaImgList(){
		return qnaMapper.selectQnaImgList();
	}
	// Qna 게시판 질문 작성
	public void addQ(QnaForm qnaForm) {
		log.debug(qnaForm.toString() + "☆☆☆☆☆☆☆☆☆☆[다원] QnaService_qnaForm debug");
		
		String qnaContent = qnaForm.getQnaContent();
		List<MultipartFile> Img = qnaForm.getQnaImg();
		
		Qna qna = new Qna();
		qna.setQnaContent(qnaContent);
		qnaMapper.addQuestion(qna);
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
			// 필요한 exception이 아닌 다른 exception을 RuntimeException()을 던져 예외 발생시킴
			// 트랜잭션 처리할 때, 필요한 과정임
			try {
				((MultipartFile) Img).transferTo(Imgfile);
				}catch(IllegalStateException | IOException e) {
					e.printStackTrace();
					
					throw new RuntimeException();
				}
			}
		}		
	}

