package com.gdu.voyage.service;

import java.io.File;
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
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired QnaMapper qnaMapper;
	
	public void addQ(QnaForm qnaForm) {
		
		Qna qna = new Qna();
		qna.setMemberNickname(qnaForm.getQna().getMemberNickname());
		qna.setQnaCategory(qnaForm.getQna().getQnaCategory());
		qna.setQnaTitle(qnaForm.getQna().getQnaTitle());
		qna.setQnaContent(qnaForm.getQna().getQnaContent());
		qna.setQnaSecret(qnaForm.getQna().getQnaSecret());
		// debug 코드
		System.out.println("qna" + qna);
		
		qnaMapper.addQ(qna);
		
		// 이미지 추가
		List<QnaImg> qnaImg = null;
		if(qnaForm.getQnaImg() != null) {
			qnaImg = new ArrayList<QnaImg>();
			for(MultipartFile mf : qnaForm.getQnaImg()) {
				QnaImg qImg = new QnaImg();
				qImg.setQnaNo(qna.getQnaNo());
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String imgName = UUID.randomUUID().toString().replace("-", "");
				qImg.setQnaImgName(imgName + ext);
				qImg.setQnaImgSize(mf.getSize());
				qImg.setQnaImgExt(mf.getContentType());
				qnaImg.add(qImg);
				// debug 코드
				logger.debug("qImg" + qImg);
				try {
					// 임시 파일 경로
					mf.transferTo(new File("C:\\Users\\dawon\\voyage\\voyage\\src\\main\\resources\\resources\\assets\\img\\"+ imgName + ext));
				}catch(Exception e) {
					e.printStackTrace();
					// Exception
					throw new RuntimeException();
				}
			}
		}
		
		if(qnaImg != null) {
			for(QnaImg qImg : qnaImg) {
				qnaMapper.addQImg(qImg);
			}
		}
	}
}
