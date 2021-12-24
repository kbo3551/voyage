package com.gdu.voyage.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaForm {
	private int qnaNo;
	private String memberId;
	private String memberNickname;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private String qnaSecret;
	private String updateDate;
	private String createDate;
	private QnaAnswer qnaAnswer;
	private MultipartFile qnaImg;
}
