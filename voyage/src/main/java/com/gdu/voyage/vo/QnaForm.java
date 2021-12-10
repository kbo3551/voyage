package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaForm {
	private Qna qna;
	private List<MultipartFile> qnaImg;
}
