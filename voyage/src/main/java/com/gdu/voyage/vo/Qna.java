package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class Qna {
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
	// 이미지 파일 -> 1:N
	private List<QnaImg> qnaImg;
	// Q&A 검색용
	private String searchWord;
}
