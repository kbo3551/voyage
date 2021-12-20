package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaForm {
	private String qnaCategory;
	private String qnaSercret;
	private String qnaContent;
	private List<MultipartFile> qnaImg;
}
